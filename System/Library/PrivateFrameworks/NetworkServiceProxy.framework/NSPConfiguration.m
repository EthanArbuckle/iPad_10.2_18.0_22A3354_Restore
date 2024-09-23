@implementation NSPConfiguration

- (NSNumber)userTier
{
  return self->_userTier;
}

- (NSNumber)proxyTrafficState
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (NSNumber)proxyAccountUnlimited
{
  return self->_proxyAccountUnlimited;
}

- (NSNumber)proxyAccountType
{
  return self->_proxyAccountType;
}

- (NSNumber)willResetSubscriberTierTomorrow
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

+ (id)proxyTrafficStateToString:(id)a3
{
  int v3;
  id v4;
  void *v5;

  v3 = objc_msgSend(a3, "unsignedLongLongValue");
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("Safari Unencrypted"));
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("Safari DNS"));
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v5, "addObject:", CFSTR("Safari Trackers"));
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v5, "addObject:", CFSTR("Safari All"));
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v5, "addObject:", CFSTR("Safari HTTP"));
  if ((v3 & 0x40000) == 0)
  {
LABEL_7:
    if ((v3 & 0x80000) == 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v5, "addObject:", CFSTR("Safari Unencrypted (Private)"));
  if ((v3 & 0x80000) == 0)
  {
LABEL_8:
    if ((v3 & 0x100000) == 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v5, "addObject:", CFSTR("Safari DNS (Private)"));
  if ((v3 & 0x100000) == 0)
  {
LABEL_9:
    if ((v3 & 0x200000) == 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v5, "addObject:", CFSTR("Safari All (Private)"));
  if ((v3 & 0x200000) == 0)
  {
LABEL_10:
    if ((v3 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v5, "addObject:", CFSTR("Safari Metrics"));
  if ((v3 & 0x20) == 0)
  {
LABEL_11:
    if ((v3 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v5, "addObject:", CFSTR("Mail Trackers"));
  if ((v3 & 0x40) == 0)
  {
LABEL_12:
    if ((v3 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v5, "addObject:", CFSTR("Any Unencrypted"));
  if ((v3 & 0x80) == 0)
  {
LABEL_13:
    if ((v3 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v5, "addObject:", CFSTR("Any DNS"));
  if ((v3 & 0x100) == 0)
  {
LABEL_14:
    if ((v3 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v5, "addObject:", CFSTR("Known Trackers"));
  if ((v3 & 0x200) == 0)
  {
LABEL_15:
    if ((v3 & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v5, "addObject:", CFSTR("Any App Trackers"));
  if ((v3 & 0x400) == 0)
  {
LABEL_16:
    if ((v3 & 0x800) == 0)
      goto LABEL_17;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v5, "addObject:", CFSTR("News URL Resolution"));
  if ((v3 & 0x800) == 0)
  {
LABEL_17:
    if ((v3 & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v5, "addObject:", CFSTR("Exposure Notifications"));
  if ((v3 & 0x1000) == 0)
  {
LABEL_18:
    if ((v3 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v5, "addObject:", CFSTR("Apple Certificates"));
  if ((v3 & 0x2000) == 0)
  {
LABEL_19:
    if ((v3 & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v5, "addObject:", CFSTR("Network Tools"));
  if ((v3 & 0x4000) == 0)
  {
LABEL_20:
    if ((v3 & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v5, "addObject:", CFSTR("Metrics Upload"));
  if ((v3 & 0x8000) == 0)
  {
LABEL_21:
    if ((v3 & 0x10000) == 0)
      goto LABEL_22;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v5, "addObject:", CFSTR("Branded Calling"));
  if ((v3 & 0x10000) == 0)
  {
LABEL_22:
    if ((v3 & 0x20000) == 0)
      goto LABEL_23;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v5, "addObject:", CFSTR("News Embedded Content"));
  if ((v3 & 0x20000) == 0)
  {
LABEL_23:
    if ((v3 & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v5, "addObject:", CFSTR("App Metrics"));
  if ((v3 & 0x400000) == 0)
  {
LABEL_24:
    if ((v3 & 0x800000) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v5, "addObject:", CFSTR("Promoted Content"));
  if ((v3 & 0x800000) == 0)
  {
LABEL_25:
    if ((v3 & 0x1000000) == 0)
      goto LABEL_26;
LABEL_53:
    objc_msgSend(v5, "addObject:", CFSTR("Password Manager Icon Fetching"));
    if ((v3 & 0x2000000) == 0)
      return v5;
    goto LABEL_27;
  }
LABEL_52:
  objc_msgSend(v5, "addObject:", CFSTR("Postback Fetch"));
  if ((v3 & 0x1000000) != 0)
    goto LABEL_53;
LABEL_26:
  if ((v3 & 0x2000000) != 0)
LABEL_27:
    objc_msgSend(v5, "addObject:", CFSTR("Launch Warning Details"));
  return v5;
}

+ (id)proxyAccountTypeToString:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "unsignedIntegerValue") == 1)
  {
    v4 = CFSTR("Free");
  }
  else if (objc_msgSend(v3, "unsignedIntegerValue") == 2)
  {
    v4 = CFSTR("Subscriber");
  }
  else
  {
    v4 = CFSTR("Unknown");
  }

  return (id)v4;
}

- (id)diagnostics
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
  uint64_t v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __CFString *v41;
  void *v42;
  void *v43;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB3578];
  -[NSPConfiguration resurrectionDate](self, "resurrectionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringFromDate:dateStyle:timeStyle:", v5, 1, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("resurrectionDate"));

  -[NSPConfiguration etag](self, "etag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Etag"));

  -[NSPConfiguration epoch](self, "epoch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("Epoch"));

  -[NSPConfiguration proxyTrafficState](self, "proxyTrafficState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSPConfiguration proxyTrafficStateToString:](NSPConfiguration, "proxyTrafficStateToString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("ProxyTrafficState"));

  v11 = (void *)MEMORY[0x1E0CB3578];
  -[NSPConfiguration anyAppEnabledDate](self, "anyAppEnabledDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringFromDate:dateStyle:timeStyle:", v12, 1, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("AnyAppEnabledDate"));

  v14 = (void *)MEMORY[0x1E0CB3578];
  -[NSPConfiguration configurationFetchDate](self, "configurationFetchDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringFromDate:dateStyle:timeStyle:", v15, 1, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("PrivacyProxyConfigurationFetchDate"));

  -[NSPConfiguration willResetSubscriberTierTomorrow](self, "willResetSubscriberTierTomorrow");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("WillResetSubscriberTierTomorrow"));

  v18 = (void *)MEMORY[0x1E0CB3578];
  -[NSPConfiguration resetTomorrowDate](self, "resetTomorrowDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringFromDate:dateStyle:timeStyle:", v19, 1, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("ResetTomorrowDate"));

  -[NSPConfiguration geohashSharingEnabledStatus](self, "geohashSharingEnabledStatus");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("GeohashSharingEnabled"));

  -[NSPConfiguration preferredPathRoutingEnabledStatus](self, "preferredPathRoutingEnabledStatus");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("PreferredPathRoutingEnabled"));

  -[NSPConfiguration privateAccessTokensEnabledStatus](self, "privateAccessTokensEnabledStatus");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("PrivateAccessTokensEnabled"));

  -[NSPConfiguration privateAccessTokensAllowTools](self, "privateAccessTokensAllowTools");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("PrivateAccessTokensAllowTools"));

  -[NSPConfiguration inProcessFlowDivert](self, "inProcessFlowDivert");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("InProcessFlowDivert"));

  -[NSPConfiguration configServerEnabled](self, "configServerEnabled");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("PrivacyProxyConfigurationServerEnabled"));

  -[NSPConfiguration configServerHost](self, "configServerHost");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("PrivacyProxyConfigurationServerHost"));

  -[NSPConfiguration userTier](self, "userTier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "intValue");
  if (v29 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v29);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = off_1E4138928[(int)v29];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("UserTier"));

  -[NSPConfiguration proxyAccountType](self, "proxyAccountType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSPConfiguration proxyAccountTypeToString:](NSPConfiguration, "proxyAccountTypeToString:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("ProxyAccountType"));

  -[NSPConfiguration proxyAccountUnlimited](self, "proxyAccountUnlimited");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("ProxyAccountUnlimited"));

  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[NSPConfiguration proxyConfiguration](self, "proxyConfiguration");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "numberWithBool:", objc_msgSend(v35, "enabled"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("TokenFetchEnabled"));

  -[NSPConfiguration enabled](self, "enabled");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("enabled"));

  -[NSPConfiguration version](self, "version");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("version"));

  -[NSPConfiguration userPreferredTier](self, "userPreferredTier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "intValue");
  if (v40 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v40);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = off_1E4138928[(int)v40];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("UserPreferredTier"));

  -[NSPConfiguration subscriberEnabledFromNonSettingsApp](self, "subscriberEnabledFromNonSettingsApp");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("SubscriberEnabledFromNonSettingsApp"));

  -[NSPConfiguration trialConfigVersion](self, "trialConfigVersion");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("TrialConfigVersion"));

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;

  if (self)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
    -[NSPConfiguration version](self, "version");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v4, CFSTR("Configuration Version"), 0, 14);

    -[NSPConfiguration enabled](self, "enabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v5, CFSTR("Enabled"), 0, 14);

    -[NSPConfiguration userTier](self, "userTier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");
    if (v7 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4138928[(int)v7];
    }
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v8, CFSTR("User Tier"), 0, 14);

    -[NSPConfiguration configServerHost](self, "configServerHost");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v9, CFSTR("Configuration Server"), 0, 14);

    -[NSPConfiguration resurrectionDate](self, "resurrectionDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v10, CFSTR("Resurrection Date"), 0, 14);

    -[NSPConfiguration configServerEnabled](self, "configServerEnabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v11, CFSTR("Config Server Enabled"), 0, 14);

    -[NSPConfiguration urlRequestTimeout](self, "urlRequestTimeout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v12, CFSTR("Waldo Request timeout"), 0, 14);

    -[NSMutableString appendPrettyBOOL:withName:andIndent:options:](v3, -[NSPConfiguration ignoreInvalidCerts](self, "ignoreInvalidCerts"), (uint64_t)CFSTR("Ignore Invalid Certs"), 0, 14);
    -[NSPConfiguration proxyConfigurationData](self, "proxyConfigurationData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v13, CFSTR("Proxy configuration received data"), 0, 14);

    -[NSPConfiguration proxyConfiguration](self, "proxyConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v15, CFSTR("Proxy configuration stored data"), 0, 14);

    -[NSPConfiguration proxyConfiguration](self, "proxyConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v16, CFSTR("Proxy configuration"), 0, 14);

    -[NSPConfiguration etag](self, "etag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v17, CFSTR("ETag"), 0, 14);

    -[NSPConfiguration epoch](self, "epoch");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v18, CFSTR("Epoch"), 0, 14);

    -[NSPConfiguration proxyTrafficState](self, "proxyTrafficState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSPConfiguration proxyTrafficStateToString:](NSPConfiguration, "proxyTrafficStateToString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v20, CFSTR("Proxy Traffic"), 0, 14);
    v21 = (void *)MEMORY[0x1E0CB3578];
    -[NSPConfiguration anyAppEnabledDate](self, "anyAppEnabledDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringFromDate:dateStyle:timeStyle:", v22, 1, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v23, CFSTR("Any App Enabled Date"), 0, 14);

    v24 = (void *)MEMORY[0x1E0CB3578];
    -[NSPConfiguration configurationFetchDate](self, "configurationFetchDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringFromDate:dateStyle:timeStyle:", v25, 1, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v26, CFSTR("Configuration Fetch Date"), 0, 14);

    -[NSPConfiguration willResetSubscriberTierTomorrow](self, "willResetSubscriberTierTomorrow");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v27, CFSTR("Will Reset Subscriber Tier Tomorrow"), 0, 14);

    v28 = (void *)MEMORY[0x1E0CB3578];
    -[NSPConfiguration resetTomorrowDate](self, "resetTomorrowDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringFromDate:dateStyle:timeStyle:", v29, 1, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v30, CFSTR("Tomorrow Reset Date"), 0, 14);

    -[NSPConfiguration cloudSubscriptionCheckEnabled](self, "cloudSubscriptionCheckEnabled");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v31, CFSTR("Cloud Subscription Check Enabled"), 0, 14);

    -[NSPConfiguration geohashSharingEnabledStatus](self, "geohashSharingEnabledStatus");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v32, CFSTR("Geohash Sharing Enabled"), 0, 14);

    -[NSPConfiguration geohashOverride](self, "geohashOverride");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v33, CFSTR("Geohash Override"), 0, 14);

    -[NSPConfiguration preferredPathRoutingEnabledStatus](self, "preferredPathRoutingEnabledStatus");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v34, CFSTR("Preferred Path Routing Enabled"), 0, 14);

    -[NSPConfiguration privateAccessTokensEnabledStatus](self, "privateAccessTokensEnabledStatus");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v35, CFSTR("Private Access Tokens Enabled"), 0, 14);

    -[NSPConfiguration privateAccessTokensAllowTools](self, "privateAccessTokensAllowTools");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v36, CFSTR("Private Access Tokens Allow Tools"), 0, 14);

    -[NSPConfiguration inProcessFlowDivert](self, "inProcessFlowDivert");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v37, CFSTR("In-Process Flow Divert"), 0, 14);

    -[NSPConfiguration proxyAccountType](self, "proxyAccountType");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSPConfiguration proxyAccountTypeToString:](NSPConfiguration, "proxyAccountTypeToString:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v39, CFSTR("Proxy Account Type"), 0, 14);

    -[NSPConfiguration proxyAccountUnlimited](self, "proxyAccountUnlimited");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v40, CFSTR("Proxy Account Unlimited"), 0, 14);

    -[NSPConfiguration userPreferredTier](self, "userPreferredTier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "intValue");
    if (v42 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v42);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = off_1E4138928[(int)v42];
    }
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v43, CFSTR("User preferred Tier"), 0, 14);

    -[NSPConfiguration subscriberEnabledFromNonSettingsApp](self, "subscriberEnabledFromNonSettingsApp");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyBOOL:withName:andIndent:options:](v3, objc_msgSend(v44, "BOOLValue"), (uint64_t)CFSTR("Subscriber Enabled from Non-Settings App"), 0, 14);

    -[NSPConfiguration trialConfigVersion](self, "trialConfigVersion");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v45, CFSTR("Trial Config Version"), 0, 14);

    -[NSPConfiguration lastPrivateCloudComputeEnvironment](self, "lastPrivateCloudComputeEnvironment");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v46, CFSTR("Last PrivateCloudCompute environment"), 0, 14);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)defaultConfiguration
{
  if (qword_1ED062BC0 != -1)
    dispatch_once(&qword_1ED062BC0, &__block_literal_global_12);
  return (id)_MergedGlobals_36;
}

void __40__NSPConfiguration_defaultConfiguration__block_invoke()
{
  void *v0;
  NSPConfiguration *v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NPWaldo *v29;
  NPWaldo *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSPConfiguration *v38;
  NPWaldo *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  uint8_t v54[4];
  const __CFString *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v41 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", CFSTR("/System/Library/PrivateFrameworks/NetworkServiceProxy.framework"));
  objc_msgSend(v41, "objectForInfoDictionaryKey:", CFSTR("NSPDefaults"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1 = -[NSPConfiguration initWithTimestamp:fromDictionary:waldoSource:]([NSPConfiguration alloc], "initWithTimestamp:fromDictionary:waldoSource:", 0, v0, 0);
    if (!v1)
    {
LABEL_48:

      goto LABEL_49;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", CFSTR("/System/Library/NetworkServiceProxy"), &v49);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v49;

    if (v4)
    {
      nplog_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v54 = 138412546;
        v55 = CFSTR("/System/Library/NetworkServiceProxy");
        v56 = 2112;
        v57 = v4;
        _os_log_error_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_ERROR, "Failed to read the contents of %@: %@", v54, 0x16u);
      }

    }
    else
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v8 = v3;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (v9)
      {
        v10 = v9;
        v35 = v3;
        v36 = v0;
        v38 = v1;
        v42 = 0;
        v4 = 0;
        v11 = *(_QWORD *)v46;
        v12 = v8;
        v43 = v8;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v46 != v11)
              objc_enumerationMutation(v12);
            objc_msgSend(CFSTR("/System/Library/NetworkServiceProxy"), "stringByAppendingFormat:", CFSTR("/%@"), *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithFileAtPath:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
            {
              objc_msgSend(v15, "open");
              objc_msgSend(v16, "streamError");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                nplog_obj();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v16, "streamError");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v51 = v14;
                  v52 = 2112;
                  v53 = v33;
                  _os_log_error_impl(&dword_19E8FE000, v18, OS_LOG_TYPE_ERROR, "Failed to open an input stream for %@: %@", buf, 0x16u);

                }
                v19 = v4;
              }
              else
              {
                v44 = 0;
                objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithStream:options:format:error:", v16, 0, 0, &v44);
                v18 = objc_claimAutoreleasedReturnValue();
                v19 = v44;

                if (v18)
                {
                  v21 = -[NSPAppRule initFromDictionary:]([NSPAppRule alloc], "initFromDictionary:", v18);
                  v22 = v21;
                  if (v21)
                  {
                    -[NSObject useCustomProtocol](v21, "useCustomProtocol");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = objc_msgSend(v23, "BOOLValue");

                    if ((v24 & 1) != 0)
                    {
                      v12 = v43;
                    }
                    else
                    {
                      v25 = v42;
                      if (!v42)
                        v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                      v42 = v25;
                      objc_msgSend(v25, "addObject:", v22);
                      -[NSObject edgeSetIdentifier](v22, "edgeSetIdentifier");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();

                      v12 = v43;
                      if (!v26)
                      {
                        -[NSObject objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("edgeSet"));
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v39 = [NPWaldo alloc];
                          -[NSObject matchSigningIdentifier](v22, "matchSigningIdentifier");
                          v28 = (void *)objc_claimAutoreleasedReturnValue();
                          v29 = v39;
                          v40 = v27;
                          v30 = -[NPWaldo initWithIdentifier:timestamp:fromDictionary:source:](v29, "initWithIdentifier:timestamp:fromDictionary:source:", v28, &unk_1E41515B8, v27, 0);

                          if (v30)
                          {
                            -[NPWaldo setEdgesGeneration:](v30, "setEdgesGeneration:", &unk_1E41515B8);
                            -[NPWaldo setUsedEdgesGeneration:](v30, "setUsedEdgesGeneration:", &unk_1E41515B8);
                            -[NSPConfiguration edgeSets](v38, "edgeSets");
                            v31 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v31)
                            {
                              -[NSPConfiguration edgeSets](v38, "edgeSets");
                              v32 = (void *)objc_claimAutoreleasedReturnValue();
                              v37 = (id)objc_msgSend(v32, "mutableCopy");

                            }
                            else
                            {
                              v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                            }
                            -[NPWaldo identifier](v30, "identifier");
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v37, "setObject:forKeyedSubscript:", v30, v34);

                            -[NSPConfiguration setEdgeSets:](v38, "setEdgeSets:", v37);
                          }

                          v12 = v43;
                          v27 = v40;
                        }

                      }
                    }
                  }
                }
                else
                {
                  nplog_obj();
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v51 = v14;
                    v52 = 2112;
                    v53 = v19;
                    _os_log_error_impl(&dword_19E8FE000, v22, OS_LOG_TYPE_ERROR, "Failed to read a rule dictionary from %@: %@", buf, 0x16u);
                  }
                }

              }
              objc_msgSend(v16, "close");
              v4 = v19;
            }
            else
            {
              nplog_obj();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v14;
                _os_log_error_impl(&dword_19E8FE000, v20, OS_LOG_TYPE_ERROR, "Failed to create a stream for %@", buf, 0xCu);
              }

            }
          }
          v10 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        }
        while (v10);

        v6 = v42;
        if (v42)
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v42);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = 0;
        }
        v3 = v35;
        v0 = v36;
        v1 = v38;
        goto LABEL_47;
      }

      v4 = 0;
    }
    v6 = 0;
    v7 = 0;
LABEL_47:

    -[NSPConfiguration setAppRules:](v1, "setAppRules:", v7);
    objc_storeStrong((id *)&_MergedGlobals_36, v1);
    goto LABEL_48;
  }
LABEL_49:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPConfiguration)initWithCoder:(id)a3
{
  id v4;
  NSPConfiguration *v5;
  uint64_t v6;
  NSNumber *version;
  uint64_t v8;
  NSNumber *enabled;
  uint64_t v10;
  NSNumber *timestamp;
  uint64_t v12;
  NSDate *resurrectionDate;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *appRules;
  uint64_t v19;
  NSNumber *configServerEnabled;
  uint64_t v21;
  NSString *configServerHost;
  uint64_t v23;
  NSNumber *configServerPort;
  uint64_t v25;
  NSString *configServerPath;
  uint64_t v27;
  NSNumber *urlRequestTimeout;
  uint64_t v29;
  NSString *waldoLeafOID;
  uint64_t v31;
  NSNumber *waldoRevocationFailClosed;
  uint64_t v33;
  NSNumber *persistMetrics;
  uint64_t v35;
  NSPPrivacyProxyConfiguration *proxyConfiguration;
  uint64_t v37;
  NSData *proxyConfigurationData;
  uint64_t v39;
  NSNumber *userTier;
  uint64_t v41;
  NSString *etag;
  uint64_t v43;
  NSNumber *epoch;
  uint64_t v45;
  NSNumber *proxyTrafficState;
  uint64_t v47;
  NSDate *anyAppEnabledDate;
  uint64_t v49;
  NSDate *configurationFetchDate;
  uint64_t v51;
  NSDate *resetTomorrowDate;
  uint64_t v53;
  NSNumber *willResetSubscriberTierTomorrow;
  uint64_t v55;
  NSNumber *cloudSubscriptionCheckEnabled;
  uint64_t v57;
  NSNumber *geohashSharingEnabledStatus;
  uint64_t v59;
  NSString *geohashOverride;
  uint64_t v61;
  NSNumber *preferredPathRoutingEnabledStatus;
  uint64_t v63;
  NSNumber *privateAccessTokensEnabledStatus;
  uint64_t v65;
  NSNumber *privateAccessTokensAllowTools;
  uint64_t v67;
  NSNumber *inProcessFlowDivert;
  uint64_t v69;
  NSNumber *proxyAccountType;
  uint64_t v71;
  NSNumber *proxyAccountUnlimited;
  uint64_t v73;
  NSNumber *userPreferredTier;
  uint64_t v75;
  NSNumber *subscriberEnabledFromNonSettingsApp;
  uint64_t v77;
  NSNumber *trialConfigVersion;
  uint64_t v79;
  NSString *lastPrivateCloudComputeEnvironment;
  objc_super v82;

  v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)NSPConfiguration;
  v5 = -[NSPConfiguration init](&v82, sel_init);
  if (v5)
  {
    v5->_diskVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("diskVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v6 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enabled"));
    v8 = objc_claimAutoreleasedReturnValue();
    enabled = v5->_enabled;
    v5->_enabled = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v10 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resurrectionDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    resurrectionDate = v5->_resurrectionDate;
    v5->_resurrectionDate = (NSDate *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("appRules"));
    v17 = objc_claimAutoreleasedReturnValue();
    appRules = v5->_appRules;
    v5->_appRules = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyConfigurationServerEnabled"));
    v19 = objc_claimAutoreleasedReturnValue();
    configServerEnabled = v5->_configServerEnabled;
    v5->_configServerEnabled = (NSNumber *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyConfigurationServerHost"));
    v21 = objc_claimAutoreleasedReturnValue();
    configServerHost = v5->_configServerHost;
    v5->_configServerHost = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyConfigurationServerPort"));
    v23 = objc_claimAutoreleasedReturnValue();
    configServerPort = v5->_configServerPort;
    v5->_configServerPort = (NSNumber *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyConfigurationServerPath"));
    v25 = objc_claimAutoreleasedReturnValue();
    configServerPath = v5->_configServerPath;
    v5->_configServerPath = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlRequestTimeout"));
    v27 = objc_claimAutoreleasedReturnValue();
    urlRequestTimeout = v5->_urlRequestTimeout;
    v5->_urlRequestTimeout = (NSNumber *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("waldoLeafOID"));
    v29 = objc_claimAutoreleasedReturnValue();
    waldoLeafOID = v5->_waldoLeafOID;
    v5->_waldoLeafOID = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("waldoRevocationFailClosed"));
    v31 = objc_claimAutoreleasedReturnValue();
    waldoRevocationFailClosed = v5->_waldoRevocationFailClosed;
    v5->_waldoRevocationFailClosed = (NSNumber *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persist-metrics"));
    v33 = objc_claimAutoreleasedReturnValue();
    persistMetrics = v5->_persistMetrics;
    v5->_persistMetrics = (NSNumber *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxyConfiguration"));
    v35 = objc_claimAutoreleasedReturnValue();
    proxyConfiguration = v5->_proxyConfiguration;
    v5->_proxyConfiguration = (NSPPrivacyProxyConfiguration *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxyConfigurationData"));
    v37 = objc_claimAutoreleasedReturnValue();
    proxyConfigurationData = v5->_proxyConfigurationData;
    v5->_proxyConfigurationData = (NSData *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserTier"));
    v39 = objc_claimAutoreleasedReturnValue();
    userTier = v5->_userTier;
    v5->_userTier = (NSNumber *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Etag"));
    v41 = objc_claimAutoreleasedReturnValue();
    etag = v5->_etag;
    v5->_etag = (NSString *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Epoch"));
    v43 = objc_claimAutoreleasedReturnValue();
    epoch = v5->_epoch;
    v5->_epoch = (NSNumber *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxyTrafficState"));
    v45 = objc_claimAutoreleasedReturnValue();
    proxyTrafficState = v5->_proxyTrafficState;
    v5->_proxyTrafficState = (NSNumber *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnyAppEnabledDate"));
    v47 = objc_claimAutoreleasedReturnValue();
    anyAppEnabledDate = v5->_anyAppEnabledDate;
    v5->_anyAppEnabledDate = (NSDate *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyConfigurationFetchDate"));
    v49 = objc_claimAutoreleasedReturnValue();
    configurationFetchDate = v5->_configurationFetchDate;
    v5->_configurationFetchDate = (NSDate *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ResetTomorrowDate"));
    v51 = objc_claimAutoreleasedReturnValue();
    resetTomorrowDate = v5->_resetTomorrowDate;
    v5->_resetTomorrowDate = (NSDate *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WillResetSubscriberTierTomorrow"));
    v53 = objc_claimAutoreleasedReturnValue();
    willResetSubscriberTierTomorrow = v5->_willResetSubscriberTierTomorrow;
    v5->_willResetSubscriberTierTomorrow = (NSNumber *)v53;

    if (os_variant_allows_internal_security_policies())
    {
      v5->_ignoreInvalidCerts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IgnoreInvalidCerts"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CloudSubscriptionCheckEnabled"));
      v55 = objc_claimAutoreleasedReturnValue();
      cloudSubscriptionCheckEnabled = v5->_cloudSubscriptionCheckEnabled;
      v5->_cloudSubscriptionCheckEnabled = (NSNumber *)v55;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GeohashSharingEnabled"));
    v57 = objc_claimAutoreleasedReturnValue();
    geohashSharingEnabledStatus = v5->_geohashSharingEnabledStatus;
    v5->_geohashSharingEnabledStatus = (NSNumber *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GeohashOverride"));
    v59 = objc_claimAutoreleasedReturnValue();
    geohashOverride = v5->_geohashOverride;
    v5->_geohashOverride = (NSString *)v59;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreferredPathRoutingEnabled"));
    v61 = objc_claimAutoreleasedReturnValue();
    preferredPathRoutingEnabledStatus = v5->_preferredPathRoutingEnabledStatus;
    v5->_preferredPathRoutingEnabledStatus = (NSNumber *)v61;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivateAccessTokensEnabled"));
    v63 = objc_claimAutoreleasedReturnValue();
    privateAccessTokensEnabledStatus = v5->_privateAccessTokensEnabledStatus;
    v5->_privateAccessTokensEnabledStatus = (NSNumber *)v63;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivateAccessTokensAllowTools"));
    v65 = objc_claimAutoreleasedReturnValue();
    privateAccessTokensAllowTools = v5->_privateAccessTokensAllowTools;
    v5->_privateAccessTokensAllowTools = (NSNumber *)v65;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InProcessFlowDivert"));
    v67 = objc_claimAutoreleasedReturnValue();
    inProcessFlowDivert = v5->_inProcessFlowDivert;
    v5->_inProcessFlowDivert = (NSNumber *)v67;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxyAccountType"));
    v69 = objc_claimAutoreleasedReturnValue();
    proxyAccountType = v5->_proxyAccountType;
    v5->_proxyAccountType = (NSNumber *)v69;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxyAccountUnlimited"));
    v71 = objc_claimAutoreleasedReturnValue();
    proxyAccountUnlimited = v5->_proxyAccountUnlimited;
    v5->_proxyAccountUnlimited = (NSNumber *)v71;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserPreferredTier"));
    v73 = objc_claimAutoreleasedReturnValue();
    userPreferredTier = v5->_userPreferredTier;
    v5->_userPreferredTier = (NSNumber *)v73;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SubscriberEnabledFromNonSettingsApp"));
    v75 = objc_claimAutoreleasedReturnValue();
    subscriberEnabledFromNonSettingsApp = v5->_subscriberEnabledFromNonSettingsApp;
    v5->_subscriberEnabledFromNonSettingsApp = (NSNumber *)v75;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TrialConfigVersion"));
    v77 = objc_claimAutoreleasedReturnValue();
    trialConfigVersion = v5->_trialConfigVersion;
    v5->_trialConfigVersion = (NSNumber *)v77;

    if (os_variant_has_internal_diagnostics())
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastPrivateCloudComputeEnvironment"));
      v79 = objc_claimAutoreleasedReturnValue();
      lastPrivateCloudComputeEnvironment = v5->_lastPrivateCloudComputeEnvironment;
      v5->_lastPrivateCloudComputeEnvironment = (NSString *)v79;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  id Property;
  void *v9;
  char IsEqual;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  id v16;
  const char *v17;
  void *v18;
  NSString *configServerHost;
  void **v20;
  const char *v21;
  id v22;
  const char *v23;
  void *v24;
  NSNumber *configServerPort;
  void **v26;
  void *v27;
  SEL v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  SEL v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  SEL v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  SEL v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;

  v71 = a3;
  objc_msgSend(v71, "encodeInteger:forKey:", 19, CFSTR("diskVersion"));
  -[NSPConfiguration version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v4, CFSTR("version"));

  -[NSPConfiguration timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v5, CFSTR("timestamp"));

  -[NSPConfiguration enabled](self, "enabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    Property = objc_getProperty(self, v6, 328, 1);
  else
    Property = 0;
  objc_msgSend(Property, "enabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IsEqual = myIsEqual(v7, v9);

  if ((IsEqual & 1) == 0)
  {
    -[NSPConfiguration enabled](self, "enabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "encodeObject:forKey:", v11, CFSTR("enabled"));

  }
  -[NSPConfiguration resurrectionDate](self, "resurrectionDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v12, CFSTR("resurrectionDate"));

  -[NSPConfiguration appRules](self, "appRules");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v13, CFSTR("appRules"));

  -[NSPConfiguration configServerEnabled](self, "configServerEnabled");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v14, CFSTR("PrivacyProxyConfigurationServerEnabled"));

  if (!self
    || (v16 = objc_getProperty(self, v15, 328, 1)) == 0
    || (v18 = v16,
        configServerHost = self->_configServerHost,
        v20 = (void **)objc_getProperty(self, v17, 328, 1),
        LOBYTE(configServerHost) = myIsEqual(configServerHost, v20[1]),
        v18,
        (configServerHost & 1) == 0))
  {
    objc_msgSend(v71, "encodeObject:forKey:", self->_configServerHost, CFSTR("PrivacyProxyConfigurationServerHost"));
  }
  v22 = objc_getProperty(self, v21, 328, 1);
  if (!v22
    || (v24 = v22,
        configServerPort = self->_configServerPort,
        v26 = (void **)objc_getProperty(self, v23, 328, 1),
        LOBYTE(configServerPort) = myIsEqual(configServerPort, v26[11]),
        v24,
        (configServerPort & 1) == 0))
  {
    objc_msgSend(v71, "encodeObject:forKey:", self->_configServerPort, CFSTR("PrivacyProxyConfigurationServerPort"));
  }
  -[NSPConfiguration configServerPath](self, "configServerPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objc_getProperty(self, v28, 328, 1), "configServerPath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = myIsEqual(v27, v29);

  if ((v30 & 1) == 0)
  {
    -[NSPConfiguration configServerPath](self, "configServerPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "encodeObject:forKey:", v31, CFSTR("PrivacyProxyConfigurationServerPath"));

  }
  -[NSPConfiguration urlRequestTimeout](self, "urlRequestTimeout");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objc_getProperty(self, v33, 328, 1), "urlRequestTimeout");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = myIsEqual(v32, v34);

  if ((v35 & 1) == 0)
  {
    -[NSPConfiguration urlRequestTimeout](self, "urlRequestTimeout");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "encodeObject:forKey:", v36, CFSTR("urlRequestTimeout"));

  }
  -[NSPConfiguration waldoLeafOID](self, "waldoLeafOID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objc_getProperty(self, v38, 328, 1), "waldoLeafOID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = myIsEqual(v37, v39);

  if ((v40 & 1) == 0)
  {
    -[NSPConfiguration waldoLeafOID](self, "waldoLeafOID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "encodeObject:forKey:", v41, CFSTR("waldoLeafOID"));

  }
  -[NSPConfiguration waldoRevocationFailClosed](self, "waldoRevocationFailClosed");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objc_getProperty(self, v43, 328, 1), "waldoRevocationFailClosed");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = myIsEqual(v42, v44);

  if ((v45 & 1) == 0)
  {
    -[NSPConfiguration waldoRevocationFailClosed](self, "waldoRevocationFailClosed");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "encodeObject:forKey:", v46, CFSTR("waldoRevocationFailClosed"));

  }
  -[NSPConfiguration persistMetrics](self, "persistMetrics");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v47, CFSTR("persist-metrics"));

  -[NSPConfiguration proxyConfiguration](self, "proxyConfiguration");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v48, CFSTR("ProxyConfiguration"));

  -[NSPConfiguration proxyConfigurationData](self, "proxyConfigurationData");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v49, CFSTR("ProxyConfigurationData"));

  -[NSPConfiguration userTier](self, "userTier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v50, CFSTR("UserTier"));

  -[NSPConfiguration proxyTrafficState](self, "proxyTrafficState");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v51, CFSTR("ProxyTrafficState"));

  -[NSPConfiguration anyAppEnabledDate](self, "anyAppEnabledDate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v52, CFSTR("AnyAppEnabledDate"));

  -[NSPConfiguration etag](self, "etag");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v53, CFSTR("Etag"));

  -[NSPConfiguration epoch](self, "epoch");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v54, CFSTR("Epoch"));

  -[NSPConfiguration configurationFetchDate](self, "configurationFetchDate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v55, CFSTR("PrivacyProxyConfigurationFetchDate"));

  -[NSPConfiguration resetTomorrowDate](self, "resetTomorrowDate");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v56, CFSTR("ResetTomorrowDate"));

  -[NSPConfiguration willResetSubscriberTierTomorrow](self, "willResetSubscriberTierTomorrow");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v57, CFSTR("WillResetSubscriberTierTomorrow"));

  if (os_variant_allows_internal_security_policies())
  {
    objc_msgSend(v71, "encodeBool:forKey:", -[NSPConfiguration ignoreInvalidCerts](self, "ignoreInvalidCerts"), CFSTR("IgnoreInvalidCerts"));
    -[NSPConfiguration cloudSubscriptionCheckEnabled](self, "cloudSubscriptionCheckEnabled");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "encodeObject:forKey:", v58, CFSTR("CloudSubscriptionCheckEnabled"));

  }
  -[NSPConfiguration geohashSharingEnabledStatus](self, "geohashSharingEnabledStatus");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v59, CFSTR("GeohashSharingEnabled"));

  -[NSPConfiguration geohashOverride](self, "geohashOverride");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v60, CFSTR("GeohashOverride"));

  -[NSPConfiguration preferredPathRoutingEnabledStatus](self, "preferredPathRoutingEnabledStatus");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v61, CFSTR("PreferredPathRoutingEnabled"));

  -[NSPConfiguration privateAccessTokensEnabledStatus](self, "privateAccessTokensEnabledStatus");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v62, CFSTR("PrivateAccessTokensEnabled"));

  -[NSPConfiguration privateAccessTokensAllowTools](self, "privateAccessTokensAllowTools");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v63, CFSTR("PrivateAccessTokensAllowTools"));

  -[NSPConfiguration inProcessFlowDivert](self, "inProcessFlowDivert");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v64, CFSTR("InProcessFlowDivert"));

  -[NSPConfiguration proxyAccountType](self, "proxyAccountType");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v65, CFSTR("ProxyAccountType"));

  -[NSPConfiguration proxyAccountUnlimited](self, "proxyAccountUnlimited");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v66, CFSTR("ProxyAccountUnlimited"));

  -[NSPConfiguration userPreferredTier](self, "userPreferredTier");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v67, CFSTR("UserPreferredTier"));

  -[NSPConfiguration subscriberEnabledFromNonSettingsApp](self, "subscriberEnabledFromNonSettingsApp");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v68, CFSTR("SubscriberEnabledFromNonSettingsApp"));

  -[NSPConfiguration trialConfigVersion](self, "trialConfigVersion");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encodeObject:forKey:", v69, CFSTR("TrialConfigVersion"));

  if (os_variant_has_internal_diagnostics())
  {
    -[NSPConfiguration lastPrivateCloudComputeEnvironment](self, "lastPrivateCloudComputeEnvironment");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "encodeObject:forKey:", v70, CFSTR("LastPrivateCloudComputeEnvironment"));

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPConfiguration *v4;
  NSPConfiguration *v5;
  int64_t diskVersion;
  void *v7;
  SEL v8;
  uint64_t v9;
  NSNumber *timestamp;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v4 = -[NSPConfiguration init](+[NSPConfiguration allocWithZone:](NSPConfiguration, "allocWithZone:", a3), "init");
  v5 = v4;
  if (self)
    diskVersion = self->_diskVersion;
  else
    diskVersion = 0;
  v4->_diskVersion = diskVersion;
  -[NSPConfiguration version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(v5, v8, v7, 24);

  -[NSPConfiguration timestamp](self, "timestamp");
  v9 = objc_claimAutoreleasedReturnValue();
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSNumber *)v9;

  -[NSPConfiguration enabled](self, "enabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setEnabled:](v5, "setEnabled:", v11);

  -[NSPConfiguration resurrectionDate](self, "resurrectionDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setResurrectionDate:](v5, "setResurrectionDate:", v12);

  -[NSPConfiguration appRules](self, "appRules");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NSPConfiguration appRules](self, "appRules");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithArray:copyItems:", v15, 1);
    -[NSPConfiguration setAppRules:](v5, "setAppRules:", v16);

  }
  objc_storeStrong((id *)&v5->_configServerHost, self->_configServerHost);
  objc_storeStrong((id *)&v5->_configServerPort, self->_configServerPort);
  -[NSPConfiguration configServerPath](self, "configServerPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setConfigServerPath:](v5, "setConfigServerPath:", v17);

  -[NSPConfiguration urlRequestTimeout](self, "urlRequestTimeout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setUrlRequestTimeout:](v5, "setUrlRequestTimeout:", v18);

  -[NSPConfiguration waldoLeafOID](self, "waldoLeafOID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setWaldoLeafOID:](v5, "setWaldoLeafOID:", v19);

  -[NSPConfiguration waldoRevocationFailClosed](self, "waldoRevocationFailClosed");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setWaldoRevocationFailClosed:](v5, "setWaldoRevocationFailClosed:", v20);

  -[NSPConfiguration configServerEnabled](self, "configServerEnabled");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setConfigServerEnabled:](v5, "setConfigServerEnabled:", v21);

  -[NSPConfiguration edgeSets](self, "edgeSets");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[NSPConfiguration edgeSets](self, "edgeSets");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithDictionary:copyItems:", v24, 1);
    -[NSPConfiguration setEdgeSets:](v5, "setEdgeSets:", v25);

  }
  -[NSPConfiguration setIgnoreInvalidCerts:](v5, "setIgnoreInvalidCerts:", -[NSPConfiguration ignoreInvalidCerts](self, "ignoreInvalidCerts"));
  -[NSPConfiguration persistMetrics](self, "persistMetrics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setPersistMetrics:](v5, "setPersistMetrics:", v26);

  -[NSPConfiguration proxyConfiguration](self, "proxyConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setProxyConfiguration:](v5, "setProxyConfiguration:", v27);

  -[NSPConfiguration userTier](self, "userTier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setUserTier:](v5, "setUserTier:", v28);

  -[NSPConfiguration proxyTrafficState](self, "proxyTrafficState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setProxyTrafficState:](v5, "setProxyTrafficState:", v29);

  -[NSPConfiguration anyAppEnabledDate](self, "anyAppEnabledDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setAnyAppEnabledDate:](v5, "setAnyAppEnabledDate:", v30);

  -[NSPConfiguration etag](self, "etag");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setEtag:](v5, "setEtag:", v31);

  -[NSPConfiguration epoch](self, "epoch");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setEpoch:](v5, "setEpoch:", v32);

  -[NSPConfiguration configurationFetchDate](self, "configurationFetchDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setConfigurationFetchDate:](v5, "setConfigurationFetchDate:", v33);

  -[NSPConfiguration resetTomorrowDate](self, "resetTomorrowDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setResetTomorrowDate:](v5, "setResetTomorrowDate:", v34);

  -[NSPConfiguration willResetSubscriberTierTomorrow](self, "willResetSubscriberTierTomorrow");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setWillResetSubscriberTierTomorrow:](v5, "setWillResetSubscriberTierTomorrow:", v35);

  -[NSPConfiguration cloudSubscriptionCheckEnabled](self, "cloudSubscriptionCheckEnabled");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setCloudSubscriptionCheckEnabled:](v5, "setCloudSubscriptionCheckEnabled:", v36);

  -[NSPConfiguration geohashSharingEnabledStatus](self, "geohashSharingEnabledStatus");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setGeohashSharingEnabledStatus:](v5, "setGeohashSharingEnabledStatus:", v37);

  -[NSPConfiguration geohashOverride](self, "geohashOverride");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setGeohashOverride:](v5, "setGeohashOverride:", v38);

  -[NSPConfiguration preferredPathRoutingEnabledStatus](self, "preferredPathRoutingEnabledStatus");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setPreferredPathRoutingEnabledStatus:](v5, "setPreferredPathRoutingEnabledStatus:", v39);

  -[NSPConfiguration privateAccessTokensEnabledStatus](self, "privateAccessTokensEnabledStatus");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setPrivateAccessTokensEnabledStatus:](v5, "setPrivateAccessTokensEnabledStatus:", v40);

  -[NSPConfiguration privateAccessTokensAllowTools](self, "privateAccessTokensAllowTools");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setPrivateAccessTokensAllowTools:](v5, "setPrivateAccessTokensAllowTools:", v41);

  -[NSPConfiguration inProcessFlowDivert](self, "inProcessFlowDivert");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setInProcessFlowDivert:](v5, "setInProcessFlowDivert:", v42);

  -[NSPConfiguration proxyAccountType](self, "proxyAccountType");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setProxyAccountType:](v5, "setProxyAccountType:", v43);

  -[NSPConfiguration proxyAccountUnlimited](self, "proxyAccountUnlimited");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setProxyAccountUnlimited:](v5, "setProxyAccountUnlimited:", v44);

  -[NSPConfiguration userPreferredTier](self, "userPreferredTier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setUserPreferredTier:](v5, "setUserPreferredTier:", v45);

  -[NSPConfiguration subscriberEnabledFromNonSettingsApp](self, "subscriberEnabledFromNonSettingsApp");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setSubscriberEnabledFromNonSettingsApp:](v5, "setSubscriberEnabledFromNonSettingsApp:", v46);

  -[NSPConfiguration trialConfigVersion](self, "trialConfigVersion");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setTrialConfigVersion:](v5, "setTrialConfigVersion:", v47);

  -[NSPConfiguration lastPrivateCloudComputeEnvironment](self, "lastPrivateCloudComputeEnvironment");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setLastPrivateCloudComputeEnvironment:](v5, "setLastPrivateCloudComputeEnvironment:", v48);

  return v5;
}

- (void)merge:(id)a3
{
  id v4;
  void *v5;
  NSNumber *v6;
  NSNumber *version;
  void *v8;
  NSNumber *v9;
  NSNumber *timestamp;
  void *v11;
  NSNumber *v12;
  NSNumber *enabled;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  NSPConfiguration *v96;
  id obj;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  _QWORD v101[5];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "version");
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    version = self->_version;
    self->_version = v6;

  }
  objc_msgSend(v4, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "timestamp");
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    timestamp = self->_timestamp;
    self->_timestamp = v9;

  }
  self->_ignoreInvalidCerts = objc_msgSend(v4, "ignoreInvalidCerts");
  objc_msgSend(v4, "enabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "enabled");
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    enabled = self->_enabled;
    self->_enabled = v12;

  }
  objc_msgSend(v4, "resurrectionDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v4, "resurrectionDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setResurrectionDate:](self, "setResurrectionDate:", v15);

  }
  v96 = self;
  objc_msgSend(v4, "appRules");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    -[NSPConfiguration appRules](self, "appRules");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = (void *)objc_msgSend(v18, "mutableCopy");

    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v95 = v4;
    objc_msgSend(v4, "appRules");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v111, 16);
    if (v100)
    {
      v98 = *(_QWORD *)v107;
      do
      {
        for (i = 0; i != v100; ++i)
        {
          if (*(_QWORD *)v107 != v98)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
          v102 = 0u;
          v103 = 0u;
          v104 = 0u;
          v105 = 0u;
          v21 = v99;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v103;
            while (2)
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v103 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
                objc_msgSend(v20, "matchSigningIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "matchSigningIdentifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v27, "isEqualToString:", v28);

                if (v29)
                {
                  objc_msgSend(v26, "merge:", v20);

                  goto LABEL_25;
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
              if (v23)
                continue;
              break;
            }
          }

          objc_msgSend(v21, "addObject:", v20);
LABEL_25:
          ;
        }
        v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v111, 16);
      }
      while (v100);
    }

    -[NSPConfiguration setAppRules:](v96, "setAppRules:", v99);
    v4 = v95;
  }
  objc_msgSend(v4, "configServerHost");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v4;
  if (v30)
  {
    objc_msgSend(v4, "configServerHost");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setConfigServerHost:](v96, "setConfigServerHost:", v32);

  }
  objc_msgSend(v4, "configServerPort");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v4, "configServerPort");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setConfigServerPort:](v96, "setConfigServerPort:", v34);

  }
  objc_msgSend(v4, "configServerPath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v4, "configServerPath");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setConfigServerPath:](v96, "setConfigServerPath:", v36);

  }
  objc_msgSend(v4, "urlRequestTimeout");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v4, "urlRequestTimeout");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setUrlRequestTimeout:](v96, "setUrlRequestTimeout:", v38);

  }
  objc_msgSend(v4, "waldoLeafOID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v4, "waldoLeafOID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setWaldoLeafOID:](v96, "setWaldoLeafOID:", v40);

  }
  objc_msgSend(v4, "waldoRevocationFailClosed");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v4, "waldoRevocationFailClosed");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setWaldoRevocationFailClosed:](v96, "setWaldoRevocationFailClosed:", v42);

  }
  objc_msgSend(v4, "configServerEnabled");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(v4, "configServerEnabled");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setConfigServerEnabled:](v96, "setConfigServerEnabled:", v44);

  }
  objc_msgSend(v4, "edgeSets");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "count");

  if (v46)
  {
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __26__NSPConfiguration_merge___block_invoke;
    v101[3] = &unk_1E41387A0;
    v101[4] = v96;
    objc_msgSend(v31, "enumerateEdgeSetsWithBlock:", v101);
    -[NSPConfiguration edgeSets](v96, "edgeSets");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v47, "mutableCopy");

    objc_msgSend(v31, "edgeSets");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addEntriesFromDictionary:", v49);

    -[NSPConfiguration setEdgeSets:](v96, "setEdgeSets:", v48);
  }
  objc_msgSend(v31, "persistMetrics");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(v31, "persistMetrics");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setPersistMetrics:](v96, "setPersistMetrics:", v51);

  }
  objc_msgSend(v31, "proxyConfiguration");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(v31, "proxyConfiguration");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setProxyConfiguration:](v96, "setProxyConfiguration:", v53);

  }
  objc_msgSend(v31, "proxyConfigurationData");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    objc_msgSend(v31, "proxyConfigurationData");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setProxyConfigurationData:](v96, "setProxyConfigurationData:", v55);

  }
  objc_msgSend(v31, "userTier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    objc_msgSend(v31, "userTier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setUserTier:](v96, "setUserTier:", v57);

  }
  objc_msgSend(v31, "proxyTrafficState");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend(v31, "proxyTrafficState");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setProxyTrafficState:](v96, "setProxyTrafficState:", v59);

  }
  objc_msgSend(v31, "anyAppEnabledDate");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    objc_msgSend(v31, "anyAppEnabledDate");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setAnyAppEnabledDate:](v96, "setAnyAppEnabledDate:", v61);

  }
  objc_msgSend(v31, "etag");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    objc_msgSend(v31, "etag");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setEtag:](v96, "setEtag:", v63);

  }
  objc_msgSend(v31, "epoch");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_msgSend(v31, "epoch");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setEpoch:](v96, "setEpoch:", v65);

  }
  objc_msgSend(v31, "configurationFetchDate");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    objc_msgSend(v31, "configurationFetchDate");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setConfigurationFetchDate:](v96, "setConfigurationFetchDate:", v67);

  }
  objc_msgSend(v31, "willResetSubscriberTierTomorrow");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend(v31, "willResetSubscriberTierTomorrow");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setWillResetSubscriberTierTomorrow:](v96, "setWillResetSubscriberTierTomorrow:", v69);

    objc_msgSend(v31, "resetTomorrowDate");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setResetTomorrowDate:](v96, "setResetTomorrowDate:", v70);

  }
  objc_msgSend(v31, "cloudSubscriptionCheckEnabled");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    objc_msgSend(v31, "cloudSubscriptionCheckEnabled");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setCloudSubscriptionCheckEnabled:](v96, "setCloudSubscriptionCheckEnabled:", v72);

  }
  objc_msgSend(v31, "geohashSharingEnabledStatus");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    objc_msgSend(v31, "geohashSharingEnabledStatus");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setGeohashSharingEnabledStatus:](v96, "setGeohashSharingEnabledStatus:", v74);

  }
  objc_msgSend(v31, "geohashOverride");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setGeohashOverride:](v96, "setGeohashOverride:", v75);

  objc_msgSend(v31, "preferredPathRoutingEnabledStatus");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    objc_msgSend(v31, "preferredPathRoutingEnabledStatus");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setPreferredPathRoutingEnabledStatus:](v96, "setPreferredPathRoutingEnabledStatus:", v77);

  }
  objc_msgSend(v31, "privateAccessTokensEnabledStatus");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    objc_msgSend(v31, "privateAccessTokensEnabledStatus");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setPrivateAccessTokensEnabledStatus:](v96, "setPrivateAccessTokensEnabledStatus:", v79);

  }
  objc_msgSend(v31, "privateAccessTokensAllowTools");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    objc_msgSend(v31, "privateAccessTokensAllowTools");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setPrivateAccessTokensAllowTools:](v96, "setPrivateAccessTokensAllowTools:", v81);

  }
  objc_msgSend(v31, "inProcessFlowDivert");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    objc_msgSend(v31, "inProcessFlowDivert");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setInProcessFlowDivert:](v96, "setInProcessFlowDivert:", v83);

  }
  objc_msgSend(v31, "proxyAccountType");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    objc_msgSend(v31, "proxyAccountType");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setProxyAccountType:](v96, "setProxyAccountType:", v85);

  }
  objc_msgSend(v31, "proxyAccountUnlimited");
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    objc_msgSend(v31, "proxyAccountUnlimited");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setProxyAccountUnlimited:](v96, "setProxyAccountUnlimited:", v87);

  }
  objc_msgSend(v31, "userPreferredTier");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
  {
    objc_msgSend(v31, "userPreferredTier");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setUserPreferredTier:](v96, "setUserPreferredTier:", v89);

  }
  objc_msgSend(v31, "subscriberEnabledFromNonSettingsApp");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    objc_msgSend(v31, "subscriberEnabledFromNonSettingsApp");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setSubscriberEnabledFromNonSettingsApp:](v96, "setSubscriberEnabledFromNonSettingsApp:", v91);

  }
  objc_msgSend(v31, "trialConfigVersion");
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (v92)
  {
    objc_msgSend(v31, "trialConfigVersion");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPConfiguration setTrialConfigVersion:](v96, "setTrialConfigVersion:", v93);

  }
  objc_msgSend(v31, "lastPrivateCloudComputeEnvironment");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setLastPrivateCloudComputeEnvironment:](v96, "setLastPrivateCloudComputeEnvironment:", v94);

}

uint64_t __26__NSPConfiguration_merge___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__NSPConfiguration_merge___block_invoke_2;
  v7[3] = &unk_1E41387A0;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateEdgeSetsWithBlock:", v7);

  return 1;
}

uint64_t __26__NSPConfiguration_merge___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "merge:missingSettingsOnly:", v3, 1);

  return v6 ^ 1u;
}

- (NSPConfiguration)initWithTimestamp:(id)a3 fromDictionary:(id)a4 waldoSource:(int64_t)a5
{
  id v8;
  id v9;
  NSPConfiguration *v10;
  void *v11;
  char isKindOfClass;
  uint64_t v13;
  NSNumber *version;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSNumber *userTier;
  uint64_t v37;
  NSNumber *userPreferredTier;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  NSNumber *proxyAccountType;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSNumber *proxyTrafficState;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t i;
  uint64_t v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t j;
  uint64_t v78;
  void *v79;
  NPWaldo *v80;
  NSPConfiguration *v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  id obj;
  NSPConfiguration *obja;
  NSPConfiguration *objb;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  objc_super v107;
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v107.receiver = self;
  v107.super_class = (Class)NSPConfiguration;
  v10 = -[NSPConfiguration init](&v107, sel_init);

  if (!v10)
    goto LABEL_107;
  objc_storeStrong((id *)&v10->_timestamp, a3);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("version"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("version"));
    v13 = objc_claimAutoreleasedReturnValue();
    version = v10->_version;
    v10->_version = (NSNumber *)v13;

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("global"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();

  if ((v16 & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("global"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("kill"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "doubleValue");
      if (v19 > 0.0)
      {
        v20 = objc_alloc(MEMORY[0x1E0C99D68]);
        objc_msgSend(v18, "doubleValue");
        v21 = (void *)objc_msgSend(v20, "initWithTimeIntervalSince1970:");
        objc_msgSend(v21, "timeIntervalSinceNow");
        if (v22 > 0.0)
          objc_storeStrong((id *)&v10->_resurrectionDate, v21);

      }
    }
    v87 = v18;
    if (a5 != 1)
    {
      -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("enabled"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v10->_enabled, v23);
      -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("waldoLeafOID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v10->_waldoLeafOID, v24);
      -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("waldoRevocationFailClosed"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v10->_waldoRevocationFailClosed, v25);
      -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("PrivacyProxyConfigurationServerEnabled"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v10->_configServerEnabled, v26);

    }
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("PrivacyProxyConfigurationServerHost"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_configServerHost, v27);
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("PrivacyProxyConfigurationServerPort"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_configServerPort, v28);
    v86 = v28;
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("PrivacyProxyConfigurationServerPath"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    obj = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_configServerPath, v29);
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("urlRequestTimeout"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v93 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_urlRequestTimeout, v30);
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("UserTier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v91 = v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v31;
      v33 = v27;
      if ((objc_msgSend(v32, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
      {
        v34 = 0;
      }
      else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("FREE")) & 1) != 0)
      {
        v34 = 1;
      }
      else if (objc_msgSend(v32, "isEqualToString:", CFSTR("SUBSCRIBER")))
      {
        v34 = 2;
      }
      else
      {
        v34 = 0;
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v34);
      v35 = objc_claimAutoreleasedReturnValue();
      userTier = v10->_userTier;
      v10->_userTier = (NSNumber *)v35;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v34);
      v37 = objc_claimAutoreleasedReturnValue();
      userPreferredTier = v10->_userPreferredTier;
      v10->_userPreferredTier = (NSNumber *)v37;

      v27 = v33;
    }
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("SubscriberEnabledFromNonSettingsApp"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_subscriberEnabledFromNonSettingsApp, v39);
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("GeohashSharingEnabled"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v89 = v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_geohashSharingEnabledStatus, v40);
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("GeohashOverride"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_geohashOverride, v41);
    v42 = v8;
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("PrivateAccessTokensEnabled"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_preferredPathRoutingEnabledStatus, v43);
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("PrivateAccessTokensEnabled"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v88 = v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_privateAccessTokensEnabledStatus, v44);
    v85 = v39;
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("PrivateAccessTokensAllowTools"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_privateAccessTokensAllowTools, v45);
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("InProcessFlowDivert"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_inProcessFlowDivert, v46);
    v84 = v46;
    -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("ProxyAccountType"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_57;
    if (objc_msgSend(v47, "isEqualToString:", CFSTR("Free")))
    {
      v48 = (void *)MEMORY[0x1E0CB37E8];
      v49 = 1;
    }
    else
    {
      if (!objc_msgSend(v47, "isEqualToString:", CFSTR("Subscriber")))
      {
LABEL_57:
        -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("ProxyAccountUnlimited"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)&v10->_proxyAccountUnlimited, v52);
        if (os_variant_has_internal_diagnostics())
        {
          v83 = v45;
          v53 = v43;
          v54 = v41;
          v55 = v8;
          v56 = v27;
          -[NSDictionary objectForPlatformSpecificKey:](v17, CFSTR("LastPrivateCloudComputeEnvironment"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_storeStrong((id *)&v10->_lastPrivateCloudComputeEnvironment, v57);

          v27 = v56;
          v8 = v55;
          v41 = v54;
          v43 = v53;
          v45 = v83;
        }

        goto LABEL_64;
      }
      v48 = (void *)MEMORY[0x1E0CB37E8];
      v49 = 2;
    }
    objc_msgSend(v48, "numberWithUnsignedInteger:", v49);
    v50 = objc_claimAutoreleasedReturnValue();
    proxyAccountType = v10->_proxyAccountType;
    v10->_proxyAccountType = (NSNumber *)v50;

    goto LABEL_57;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 66977004, v83);
  v58 = objc_claimAutoreleasedReturnValue();
  proxyTrafficState = v10->_proxyTrafficState;
  v10->_proxyTrafficState = (NSNumber *)v58;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("apps"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v60, "count"))
  {
    v94 = v60;
    obja = v10;
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v61 = v60;
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v103, v109, 16);
    if (v62)
    {
      v63 = v62;
      v64 = v9;
      v65 = v8;
      v66 = 0;
      v67 = *(_QWORD *)v104;
      do
      {
        for (i = 0; i != v63; ++i)
        {
          if (*(_QWORD *)v104 != v67)
            objc_enumerationMutation(v61);
          v69 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v70 = -[NSPAppRule initFromDictionary:]([NSPAppRule alloc], "initFromDictionary:", v69);
            if (v70)
            {
              if (!v66)
                v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v66, "addObject:", v70);
            }

          }
        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v103, v109, 16);
      }
      while (v63);
    }
    else
    {
      v64 = v9;
      v65 = v8;
      v66 = 0;
    }

    v8 = v65;
    v9 = v64;
    v10 = obja;
    if (objc_msgSend(v66, "count"))
      objc_storeStrong((id *)&obja->_appRules, v66);

    v60 = v94;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("edgeSets"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v71, "count"))
  {
    objb = v10;
    v90 = v71;
    v92 = v9;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v72 = v71;
    v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
    if (v73)
    {
      v74 = v73;
      v75 = 0;
      v76 = *(_QWORD *)v100;
      do
      {
        for (j = 0; j != v74; ++j)
        {
          if (*(_QWORD *)v100 != v76)
            objc_enumerationMutation(v72);
          v78 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v72, "objectForKeyedSubscript:", v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v80 = -[NPWaldo initWithIdentifier:timestamp:fromDictionary:source:]([NPWaldo alloc], "initWithIdentifier:timestamp:fromDictionary:source:", v78, 0, v79, a5);
              if (v80)
              {
                if (!v75)
                  v75 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(v75, "setObject:forKeyedSubscript:", v80, v78);
              }

            }
          }
        }
        v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
      }
      while (v74);
    }
    else
    {
      v75 = 0;
    }

    v10 = objb;
    if (objc_msgSend(v75, "count"))
      objc_storeStrong((id *)&objb->_edgeSets, v75);

    v71 = v90;
    v9 = v92;
  }
  v81 = v10;

LABEL_107:
  return v10;
}

- (id)initFromKeychain
{
  id v3;
  void *v4;
  NSObject *v5;
  NSPConfiguration *v6;
  id v7;
  NSDictionary *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  NSDictionary *edgeSets;
  NSPConfiguration *v35;
  int64_t diskVersion;
  void *v38;
  NSObject *v39;
  id v40;
  NSPConfiguration *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  int64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = +[NPUtilities copyDataFromKeychainWithIdentifier:accountName:](NPUtilities, "copyDataFromKeychainWithIdentifier:accountName:", CFSTR("com.apple.NetworkServiceProxy.Configuration"), CFSTR("configuration"));
  if (v3)
  {
    v51 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v51);
    v5 = v51;
    if (v4)
    {
      v6 = -[NSPConfiguration initWithCoder:](self, "initWithCoder:", v4);
      if (v6)
      {
        self = v6;
        if (v6->_diskVersion == 9)
        {
          v38 = v4;
          v39 = v5;
          v40 = v3;
          v7 = +[NPUtilities copyItemIdentifiersFromKeychainWithAccountName:](NPUtilities, "copyItemIdentifiersFromKeychainWithAccountName:", CFSTR("waldo"));
          v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v41 = self;
          -[NSPConfiguration appRules](self, "appRules");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v48;
            v13 = 0x1E0CB3000uLL;
            v14 = CFSTR("com.apple.NetworkServiceProxy.WaldoInfo");
            do
            {
              v15 = 0;
              v42 = v11;
              do
              {
                if (*(_QWORD *)v48 != v12)
                  objc_enumerationMutation(v9);
                v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v15);
                objc_msgSend(v16, "edgeSetIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17
                  || (objc_msgSend(v16, "matchSigningIdentifier"),
                      (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                {
                  if (objc_msgSend(v7, "count"))
                  {
                    v18 = (void *)objc_msgSend(objc_alloc(*(Class *)(v13 + 2368)), "initWithFormat:", CFSTR("%@.%@"), v14, v17);
                    objc_msgSend(v7, "removeObject:", v18);

                  }
                  -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v17);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v19)
                  {
                    v20 = -[NPWaldo initFromKeychainWithIdentifier:]([NPWaldo alloc], "initFromKeychainWithIdentifier:", v17);
                    v21 = v20;
                    if (v20)
                    {
                      v22 = v7;
                      v23 = v12;
                      v24 = v9;
                      v25 = v14;
                      v26 = v13;
                      objc_msgSend(v20, "hostname");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v27)
                      {
                        -[NSPConfiguration configServerHost](v41, "configServerHost");
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "setHostname:", v28);

                      }
                      -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v21, v17);
                      v13 = v26;
                      v14 = v25;
                      v9 = v24;
                      v12 = v23;
                      v7 = v22;
                      v11 = v42;
                    }

                  }
                }

                ++v15;
              }
              while (v11 != v15);
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
            }
            while (v11);
          }

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v29 = v7;
          v30 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v44;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v44 != v32)
                  objc_enumerationMutation(v29);
                +[NPUtilities removeDataFromKeychainWithIdentifier:](NPUtilities, "removeDataFromKeychainWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
              }
              v31 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
            }
            while (v31);
          }

          edgeSets = v41->_edgeSets;
          v41->_edgeSets = v8;

          self = v41;
          v35 = self;
          v5 = v39;
          v3 = v40;
          v4 = v38;
          goto LABEL_41;
        }
        nplog_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          diskVersion = self->_diskVersion;
          *(_DWORD *)buf = 134218240;
          v55 = diskVersion;
          v56 = 2048;
          v57 = 9;
          _os_log_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_INFO, "Saved disk version of configuration (%ld) does not match latest supported version (%ld)", buf, 0x16u);
        }
      }
      else
      {
        nplog_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_ERROR, "Failed to decode the NSP configuration from the keychain", buf, 2u);
        }
        self = 0;
      }
    }
    else
    {
      nplog_obj();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v55 = (int64_t)v5;
        _os_log_error_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the NSP configuration: %@", buf, 0xCu);
      }
    }
    v35 = 0;
LABEL_41:

    goto LABEL_42;
  }
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "No Waldo info in the keychain", buf, 2u);
  }
  v35 = 0;
LABEL_42:

  return v35;
}

- (void)saveToKeychain
{
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id Property;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id obj;
  uint64_t v28;
  NSPConfiguration *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  +[NSPConfiguration defaultConfiguration](NSPConfiguration, "defaultConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_setProperty_atomic(self, v3, v4, 328);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[NSPConfiguration appRules](self, "appRules");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v41;
    v29 = self;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v41 != v28)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v6);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        if (self)
          Property = objc_getProperty(self, v5, 328, 1);
        else
          Property = 0;
        objc_msgSend(Property, "appRules");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v37;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v37 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_msgSend(v7, "matchSigningIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "matchSigningIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v15, "isEqualToString:", v16);

              if (v17)
              {
                objc_msgSend(v7, "setDefaults:", v14);
                goto LABEL_20;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_20:

        ++v6;
        self = v29;
      }
      while (v6 != v30);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      v30 = v18;
    }
    while (v18);
  }

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[NSPConfiguration encodeWithCoder:](self, "encodeWithCoder:", v19);
  objc_msgSend(v19, "encodedData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPUtilities saveDataToKeychain:withIdentifier:accountName:](NPUtilities, "saveDataToKeychain:withIdentifier:accountName:", v20, CFSTR("com.apple.NetworkServiceProxy.Configuration"), CFSTR("configuration"));

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __34__NSPConfiguration_saveToKeychain__block_invoke;
  v35[3] = &unk_1E41387A0;
  v35[4] = self;
  -[NSPConfiguration enumerateEdgeSetsWithBlock:](self, "enumerateEdgeSetsWithBlock:", v35);
  if (self)
    objc_setProperty_atomic(self, v21, 0, 328);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[NSPConfiguration appRules](self, "appRules");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "setDefaults:", 0);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v24);
  }

}

uint64_t __34__NSPConfiguration_saveToKeychain__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(v3, "setShouldSave:", 1);
  objc_msgSend(*(id *)(a1 + 32), "configServerHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHostname:", v4);

  objc_msgSend(v3, "saveToKeychain");
  return 1;
}

- (void)removeFromKeychain
{
  +[NPUtilities removeDataFromKeychainWithIdentifier:](NPUtilities, "removeDataFromKeychainWithIdentifier:", CFSTR("com.apple.NetworkServiceProxy.Configuration"));
  -[NSPConfiguration enumerateEdgeSetsWithBlock:](self, "enumerateEdgeSetsWithBlock:", &__block_literal_global_298);
}

uint64_t __38__NSPConfiguration_removeFromKeychain__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "removeFromKeychain");
  return 1;
}

- (id)copyTLVData
{
  id v3;
  void *v4;
  int v5;
  int v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v7 = 0;
  -[NSPConfiguration persistMetrics](self, "persistMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
    v7 = 4;
  -[NSMutableData appendType:length:value:](v3, 2, 4u, (uint64_t)&v7);
  return v3;
}

- (id)initFromTLVs:(id)a3
{
  id v4;
  NSPConfiguration *v5;
  void *v6;
  _QWORD v8[4];
  NSPConfiguration *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NSPConfiguration;
  v5 = -[NSPConfiguration init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __33__NSPConfiguration_initFromTLVs___block_invoke;
    v8[3] = &unk_1E4137CC8;
    v9 = v5;
    -[NSMutableData enumerateTLVsUsingBlock:](v6, v8);

  }
  return v5;
}

uint64_t __33__NSPConfiguration_initFromTLVs___block_invoke(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2 == 2 && a3 == 4;
  v5 = !v4;
  if (v4)
  {
    if ((*a4 & 4) != 0)
      v6 = MEMORY[0x1E0C9AAB0];
    else
      v6 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(*(id *)(a1 + 32), "setPersistMetrics:", v6);
  }
  return v5;
}

- (void)enumerateEdgeSetsWithBlock:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSPConfiguration edgeSets](self, "edgeSets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
      -[NSPConfiguration edgeSets](self, "edgeSets");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v4[2](v4, v12);

      if (!v13)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)copyAgentResultsForAppRule:(id)a3
{
  id v4;
  id v5;
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

  v4 = a3;
  objc_msgSend(v4, "agent");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CD0850];
    objc_msgSend(v4, "agent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "agentUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "netAgentUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "addObject:", v9);
    objc_msgSend(v4, "edgeSetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSPConfiguration edgeSets](self, "edgeSets");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "edgeSetIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        goto LABEL_5;
    }
    -[NSPConfiguration edgeSets](self, "edgeSets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchSigningIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
LABEL_5:
      objc_msgSend(v13, "agent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "agentUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = (void *)MEMORY[0x1E0CD0850];
        objc_msgSend(v13, "agent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "agentUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "netAgentUUID:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v21);
      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v5;
}

- (void)updateNetworkAgents
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSPNetworkAgent *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSPConfiguration appRules](self, "appRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v26;
    *(_QWORD *)&v5 = 138412290;
    v24 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "agent", v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = objc_alloc_init(NSPNetworkAgent);
          objc_msgSend(v10, "setAgent:", v12);

          objc_msgSend(v10, "agent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setAppRule:", v10);

          objc_msgSend(v10, "agent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setConfiguration:", self);

          v15 = objc_alloc(MEMORY[0x1E0CCEC90]);
          objc_msgSend(v10, "agent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v15, "initWithNetworkAgentClass:", objc_opt_class());
          objc_msgSend(v10, "setAgentRegistration:", v17);

        }
        objc_msgSend(v10, "enabled");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "BOOLValue");

        if (v19)
        {
          objc_msgSend(v10, "configurationIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20 == 0;

          v7 |= v21;
          if ((objc_msgSend(v10, "updateNetworkAgent") & 1) == 0)
          {
            nplog_obj();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v10, "matchSigningIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v24;
              v30 = v23;
              _os_log_error_impl(&dword_19E8FE000, v22, OS_LOG_TYPE_ERROR, "Failed to update the network agent for %@", buf, 0xCu);

            }
          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v6);

    if ((v7 & 1) != 0)
      -[NSPConfiguration saveToKeychain](self, "saveToKeychain");
  }
  else
  {

  }
}

- (void)setupNSURLSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
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
  NSURLSessionDelegate *v21;

  v21 = objc_alloc_init(NSURLSessionDelegate);
  objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_socketStreamProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E08];
  if (v4)
  {
    objc_msgSend(v3, "_socketStreamProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C93048]);
  objc_msgSend(v3, "set_socketStreamProperties:", v7);
  -[NSPConfiguration urlRequestTimeout](self, "urlRequestTimeout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  if (v10 <= 0.0)
  {
    objc_msgSend(v3, "setTimeoutIntervalForResource:", 30.0);
  }
  else
  {
    -[NSPConfiguration urlRequestTimeout](self, "urlRequestTimeout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(v3, "setTimeoutIntervalForResource:");

  }
  -[NSPConfiguration configServerHost](self, "configServerHost");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionDelegate setValidationHostname:](v21, "setValidationHostname:", v12);

  -[NSPConfiguration waldoLeafOID](self, "waldoLeafOID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionDelegate setLeafOID:](v21, "setLeafOID:", v13);

  -[NSURLSessionDelegate setIgnoreInvalidCerts:](v21, "setIgnoreInvalidCerts:", -[NSPConfiguration ignoreInvalidCerts](self, "ignoreInvalidCerts"));
  -[NSPConfiguration waldoRevocationFailClosed](self, "waldoRevocationFailClosed");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionDelegate setRevocationFailClosed:](v21, "setRevocationFailClosed:", objc_msgSend(v14, "BOOLValue"));

  -[NSPConfiguration privacyProxyURLSession](self, "privacyProxyURLSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NSPConfiguration privacyProxyURLSession](self, "privacyProxyURLSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidateAndCancel");

  }
  v17 = (void *)MEMORY[0x1E0CB39F0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sessionWithConfiguration:delegate:delegateQueue:", v3, v21, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration setPrivacyProxyURLSession:](self, "setPrivacyProxyURLSession:", v19);

  -[NSPConfiguration privacyProxyURLSession](self, "privacyProxyURLSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSessionDescription:", CFSTR("PrivacyProxy"));

}

- (void)setup
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NSPConfiguration setupNSURLSession](self, "setupNSURLSession");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSPConfiguration appRules](self, "appRules");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "edgeSetIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8
          || (objc_msgSend(v7, "matchSigningIdentifier"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[NSPConfiguration edgeSets](self, "edgeSets");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v7, "connectionIdleTimeout");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "connectionIdleTimeoutMaximum");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v11)
              goto LABEL_12;
            objc_msgSend(v7, "connectionIdleTimeout");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "compare:", v13);

            if (v14 == -1)
            {
              objc_msgSend(v10, "connectionIdleTimeoutMaximum");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
              objc_msgSend(v7, "setConnectionIdleTimeout:", v12);

            }
          }

        }
        objc_msgSend(v7, "connectionIdleTimeout");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          objc_msgSend(v7, "setConnectionIdleTimeout:", &unk_1E41515D0);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

}

- (NSDate)earliestEnableCheckDate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSPConfiguration appRules](self, "appRules", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "enableCheckDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "enableCheckDate");
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v10;
          if (v5)
          {
            objc_msgSend(v5, "earlierDate:", v10);
            v12 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v12;
          }
          else
          {
            v5 = (void *)v10;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (BOOL)evaluateEnableRatios
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = -[NSPConfiguration isDead](self, "isDead");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[NSPConfiguration appRules](self, "appRules", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v30;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "disabledByRatio");
        objc_msgSend(v10, "enableRatio");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_11;
        v13 = (void *)v12;
        objc_msgSend(v10, "enableRatio");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;

        v17 = v16 >= 1.0 || v3;
        if ((v17 & 1) != 0)
        {
LABEL_11:
          objc_msgSend(v10, "setEnableCheckDate:", 0);
          if ((objc_msgSend(v10, "disabledByRatio") & 1) == 0)
            continue;
          v11 = 0;
LABEL_19:
          objc_msgSend(v10, "setDisabledByRatio:", v11);
          v7 = 1;
          continue;
        }
        objc_msgSend(v10, "enableCheckDate");
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18
          || (v19 = (void *)v18,
              objc_msgSend(v10, "enableCheckDate"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v20, "timeIntervalSinceNow"),
              v22 = v21,
              v20,
              v19,
              v22 < 0.0))
        {
          objc_msgSend(v10, "reenableInterval");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          v25 = v24;

          objc_msgSend(v10, "enableRatio");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = +[NPUtilities rollDiceWithSuccessRatio:](NPUtilities, "rollDiceWithSuccessRatio:", v26) ^ 1;

          if (v25 == 0.0)
            v25 = 3600.0;
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", v25);
          objc_msgSend(v10, "setEnableCheckDate:", v27);

        }
        if ((_DWORD)v11 != objc_msgSend(v10, "disabledByRatio"))
          goto LABEL_19;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (!v6)
        goto LABEL_24;
    }
  }
  v7 = 0;
LABEL_24:

  return v7 & 1;
}

- (void)teardown
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSPConfiguration appRules](self, "appRules", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "teardownNetworkAgent");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSPConfiguration enumerateEdgeSetsWithBlock:](self, "enumerateEdgeSetsWithBlock:", &__block_literal_global_311);
}

uint64_t __28__NSPConfiguration_teardown__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "teardownNetworkAgent");
  return 1;
}

- (NSDate)dayPassExpirationDate
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__NSPConfiguration_dayPassExpirationDate__block_invoke;
  v4[3] = &unk_1E4138828;
  v4[4] = &v5;
  -[NSPConfiguration enumerateEdgeSetsWithBlock:](self, "enumerateEdgeSetsWithBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

uint64_t __41__NSPConfiguration_dayPassExpirationDate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    if (v5)
    {
      objc_msgSend(v5, "laterDate:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;
    }
    else
    {
      v9 = v3;
      v8 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v9;
    }

  }
  return 1;
}

- (id)createConfigFetchURLWithPath:(id)a3 timestamp:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v5 = a3;
  -[NSPConfiguration configServerHost](self, "configServerHost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration configServerPort](self, "configServerPort");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = v8;
  if (!v7)
  {
    if (v5)
    {
      v10 = objc_msgSend(v8, "initWithFormat:", CFSTR("https://%@/%@"), v6, v5, v16);
      goto LABEL_6;
    }
    -[NSPConfiguration configServerPath](self, "configServerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "initWithFormat:", CFSTR("https://%@/%@"), v6, v12, v16);
LABEL_9:
    v11 = (void *)v13;

    goto LABEL_10;
  }
  if (!v5)
  {
    -[NSPConfiguration configServerPath](self, "configServerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "initWithFormat:", CFSTR("https://%@:%@/%@"), v6, v7, v12);
    goto LABEL_9;
  }
  v10 = objc_msgSend(v8, "initWithFormat:", CFSTR("https://%@:%@/%@"), v6, v7, v5);
LABEL_6:
  v11 = (void *)v10;
LABEL_10:
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v11);

  return v14;
}

- (id)getEdgeSetForSigningIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSPConfiguration appRules](self, "appRules", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      objc_msgSend(v10, "matchSigningIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if (v12)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    objc_msgSend(v10, "edgeSetIdentifier");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13 || (v13 = v4) != 0)
    {
      -[NSPConfiguration edgeSets](self, "edgeSets");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
  }
LABEL_13:
  v15 = 0;
LABEL_14:

  return v15;
}

- (id)getEdgeSetForAppRule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4
    && ((objc_msgSend(v4, "edgeSetIdentifier"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
     || (objc_msgSend(v5, "matchSigningIdentifier"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    -[NSPConfiguration edgeSets](self, "edgeSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getCurrentKeyBagForAppRule:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[NSPConfiguration edgeSets](self, "edgeSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[NSPConfiguration getEdgeSetForAppRule:](self, "getEdgeSetForAppRule:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "keybag");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v8, "keybag");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isDead
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[NSPConfiguration resurrectionDate](self, "resurrectionDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSPConfiguration resurrectionDate](self, "resurrectionDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5 > 0.0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setConfigServerHost:(id)a3
{
  objc_storeStrong((id *)&self->_configServerHost, a3);
}

- (NSString)configServerHost
{
  __CFString *v2;

  v2 = self->_configServerHost;
  if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("mask-api.icloud.com"))
    && os_variant_has_internal_diagnostics())
  {

    v2 = CFSTR("mask-api.icloud.com");
  }
  return (NSString *)v2;
}

- (BOOL)resetStaleEdgeSets
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  NSPConfiguration *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  +[NSPConfiguration defaultConfiguration](NSPConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPConfiguration configServerHost](self, "configServerHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  v24 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __38__NSPConfiguration_resetStaleEdgeSets__block_invoke;
  v14 = &unk_1E4138850;
  v5 = v4;
  v18 = &v19;
  v15 = v5;
  v16 = self;
  v6 = v3;
  v17 = v6;
  -[NSPConfiguration enumerateEdgeSetsWithBlock:](self, "enumerateEdgeSetsWithBlock:", &v11);
  v7 = v20[5];
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D80]);
    v9 = (void *)objc_msgSend(v8, "initWithDictionary:", v20[5], v11, v12, v13, v14, v15, v16);
    -[NSPConfiguration setEdgeSets:](self, "setEdgeSets:", v9);

  }
  _Block_object_dispose(&v19, 8);

  return v7 != 0;
}

uint64_t __38__NSPConfiguration_resetStaleEdgeSets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a2;
  if (objc_msgSend(v3, "source") == 1)
  {
    objc_msgSend(v3, "hostname");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(v3, "hostname");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

      if ((v7 & 1) == 0)
      {
        objc_msgSend(v3, "removeDayPassesFromKernel");
        objc_msgSend(v3, "teardownNetworkAgent");
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          objc_msgSend(*(id *)(a1 + 40), "edgeSets");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "mutableCopy");
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v11 = *(void **)(v10 + 40);
          *(_QWORD *)(v10 + 40) = v9;

        }
        objc_msgSend(*(id *)(a1 + 48), "edgeSets");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = (void *)objc_msgSend(v14, "copy");
          v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          objc_msgSend(v3, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

        }
        else
        {
          objc_msgSend(v3, "removeFromKeychain");
          v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          objc_msgSend(v3, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, v15);
        }

      }
    }
  }

  return 1;
}

- (void)incrementSessionCountersOnFirstLaunch
{
  void *v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__NSPConfiguration_incrementSessionCountersOnFirstLaunch__block_invoke;
  v6[3] = &unk_1E4138878;
  v6[4] = &v7;
  objc_msgSend(v3, "iterateFileHandlesWithBlock:", v6);

  if (!*((_BYTE *)v8 + 24))
  {
    nplog_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEFAULT, "First launch after boot, incrementing session counters", v5, 2u);
    }

    -[NSPConfiguration enumerateEdgeSetsWithBlock:](self, "enumerateEdgeSetsWithBlock:", &__block_literal_global_322);
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __57__NSPConfiguration_incrementSessionCountersOnFirstLaunch__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

uint64_t __57__NSPConfiguration_incrementSessionCountersOnFirstLaunch__block_invoke_321(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "incrementSessionCounters");
  return 1;
}

+ (BOOL)validatePrivacyProxyConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  int v31;
  void *v32;
  unint64_t v33;
  const char *v34;
  NSObject *v36;
  NSObject *v37;
  uint32_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  NSObject *v42;
  uint32_t v43;
  int v44;
  _BOOL4 v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  unsigned int v67;
  unsigned int v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  unsigned int v76;
  unsigned int v77;
  void *v78;
  void *v79;
  unint64_t v80;
  unint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  char v88;
  uint64_t v89;
  __CFString *v90;
  const char *v91;
  NSObject *v92;
  const char *v93;
  NSObject *v94;
  uint32_t v95;
  NSObject *v96;
  NSObject *v97;
  uint32_t v98;
  const char *v99;
  NSObject *v100;
  uint32_t v101;
  NSObject *v102;
  const char *v103;
  NSObject *v104;
  uint32_t v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t buf[4];
  _BYTE v113[18];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v113 = "+[NSPConfiguration validatePrivacyProxyConfiguration:]";
      _os_log_fault_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_FAULT, "%s called with null configuration", buf, 0xCu);
    }
    goto LABEL_34;
  }
  if (objc_msgSend(v3, "version") != 1)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v113 = objc_msgSend(v4, "version");
      _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Configuration version %u not supported", buf, 8u);
    }
    goto LABEL_34;
  }
  if (!objc_msgSend(v4, "enabled"))
  {
    v15 = 1;
    goto LABEL_36;
  }
  objc_msgSend(v4, "authInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "authType"))
  {

LABEL_14:
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "authInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "authType");
      if (v17 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = off_1E41388E0[(int)v17];
      }
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v113 = v18;
      _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "Configuration has bad authentication type: %@", buf, 0xCu);

    }
    goto LABEL_34;
  }
  objc_msgSend(v4, "authInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "authType");

  if (v7 >= 4)
    goto LABEL_14;
  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "authInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_32;
  -[NSObject host](v11, "host");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_32;
  v13 = (void *)v12;
  -[NSObject scheme](v11, "scheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("https")))
  {

    goto LABEL_18;
  }
  -[NSObject scheme](v11, "scheme");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("http"));

  if ((v20 & 1) == 0)
  {
LABEL_32:
    nplog_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v113 = v11;
    v34 = "Bad authentication url format %@";
    v37 = v23;
    v38 = 12;
    goto LABEL_48;
  }
LABEL_18:
  objc_msgSend(v4, "policyTierMaps");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22 != 2)
  {
    nplog_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    objc_msgSend(v4, "policyTierMaps");
    v36 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v113 = -[NSObject count](v36, "count");
    _os_log_error_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_ERROR, "Invalid policy tier count %lu", buf, 0xCu);
    goto LABEL_40;
  }
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  objc_msgSend(v4, "policyTierMaps");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v108, v114, 16);
  if (!v24)
  {

LABEL_44:
    nplog_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v34 = "configuration should contain policies for both tiers";
LABEL_46:
    v37 = v23;
    v38 = 2;
LABEL_48:
    _os_log_error_impl(&dword_19E8FE000, v37, OS_LOG_TYPE_ERROR, v34, buf, v38);
    goto LABEL_33;
  }
  v25 = v24;
  v26 = 0;
  v27 = 0;
  v28 = *(_QWORD *)v109;
  do
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v109 != v28)
        objc_enumerationMutation(v23);
      v30 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
      if (!objc_msgSend(v30, "tier") || (int)objc_msgSend(v30, "tier") >= 3)
      {
        nplog_obj();
        v36 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          goto LABEL_40;
        v39 = objc_msgSend(v30, "tier");
        if (v39 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v39);
          v40 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v40 = off_1E4138928[(int)v39];
        }
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v113 = v40;
        v41 = "bad policy tier type %@";
        v42 = v36;
LABEL_55:
        v43 = 12;
        goto LABEL_56;
      }
      v31 = objc_msgSend(v30, "tier");
      v26 |= v31 != 1;
      v27 |= v31 == 1;
    }
    v25 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v108, v114, 16);
  }
  while (v25);

  if ((v27 & v26 & 1) == 0)
    goto LABEL_44;
  objc_msgSend(v4, "proxies");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33 < 2)
  {
    nplog_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v34 = "bad configuration need atleast two proxies";
    goto LABEL_46;
  }
  if (!objc_msgSend(v4, "proxiesCount"))
  {
LABEL_105:
    nplog_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v34 = "configuratio should contain both ingress and egress proxy";
    goto LABEL_46;
  }
  v106 = 0;
  v107 = 0;
  while (2)
  {
    objc_msgSend(v4, "proxiesAtIndex:", v107);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject proxyHop](v23, "proxyHop") && (int)-[NSObject proxyHop](v23, "proxyHop") >= 3)
    {
      nplog_obj();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v89 = -[NSObject proxyHop](v23, "proxyHop");
        if (v89 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v89);
          v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v90 = off_1E4138908[(int)v89];
        }
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v113 = v107;
        *(_WORD *)&v113[8] = 2112;
        *(_QWORD *)&v113[10] = v90;
        _os_log_error_impl(&dword_19E8FE000, v36, OS_LOG_TYPE_ERROR, "proxy hop at %lu has invalid hop type %@", buf, 0x16u);

      }
      goto LABEL_40;
    }
    v44 = -[NSObject proxyHop](v23, "proxyHop");
    v45 = v44 == 1;
    v46 = v44 != 1;
    v47 = (void *)MEMORY[0x1E0C99E98];
    -[NSObject proxyURL](v23, "proxyURL");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "URLWithString:", v48);
    v36 = objc_claimAutoreleasedReturnValue();

    if (!v36)
      goto LABEL_107;
    -[NSObject host](v36, "host");
    v49 = objc_claimAutoreleasedReturnValue();
    if (!v49
      || (v50 = (void *)v49,
          -[NSObject scheme](v36, "scheme"),
          v51 = (void *)objc_claimAutoreleasedReturnValue(),
          v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("https")),
          v51,
          v50,
          (v52 & 1) == 0))
    {
LABEL_107:
      nplog_obj();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v113 = v36;
        v41 = "Bad proxy url format %@";
        goto LABEL_113;
      }
LABEL_57:

LABEL_40:
      goto LABEL_33;
    }
    -[NSObject proxyKeyInfos](v23, "proxyKeyInfos");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "count");

    if (!v54)
    {
      nplog_obj();
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        goto LABEL_57;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v113 = v36;
      v41 = "Proxy %@ needs proxy keys";
LABEL_113:
      v42 = v40;
      goto LABEL_55;
    }
    -[NSObject proxyKeyInfos](v23, "proxyKeyInfos");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "count");

    if (v56)
    {
      v57 = 0;
      while (1)
      {
        -[NSObject proxyKeyInfoAtIndex:](v23, "proxyKeyInfoAtIndex:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v58)
          break;
        ++v57;
        -[NSObject proxyKeyInfos](v23, "proxyKeyInfos");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "count");

        if (v57 >= v60)
          goto LABEL_70;
      }
      nplog_obj();
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        goto LABEL_57;
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v113 = v57;
      *(_WORD *)&v113[8] = 2112;
      *(_QWORD *)&v113[10] = v36;
      v41 = "proxy key info for index %lu is nil for proxy %@";
      v42 = v40;
      v43 = 22;
LABEL_56:
      _os_log_error_impl(&dword_19E8FE000, v42, OS_LOG_TYPE_ERROR, v41, buf, v43);
      goto LABEL_57;
    }
LABEL_70:
    -[NSObject tokenKeyInfo](v23, "tokenKeyInfo");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v61)
    {
      nplog_obj();
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        goto LABEL_57;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v113 = v36;
      v41 = "token issuance key is nil for proxy %@";
      goto LABEL_113;
    }
    LODWORD(v106) = v46 | v106;
    HIDWORD(v106) |= v45;

    if (++v107 < (unint64_t)objc_msgSend(v4, "proxiesCount"))
      continue;
    break;
  }
  if ((HIDWORD(v106) & v106 & 1) == 0)
    goto LABEL_105;
  objc_msgSend(v4, "pathWeights");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "count");

  if (!v63)
  {
    nplog_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v34 = "configuration should contain atleast one proxy path weight";
    goto LABEL_46;
  }
  objc_msgSend(v4, "pathWeights");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "count");

  if (!v65)
  {
LABEL_83:
    objc_msgSend(v4, "fallbackPathWeights");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "count");

    if (v74)
    {
      v75 = 0;
      while (1)
      {
        objc_msgSend(v4, "fallbackPathWeightsAtIndex:", v75);
        v23 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject weight](v23, "weight") >= 0x65)
        {
          nplog_obj();
          v69 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            goto LABEL_156;
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v113 = v75;
          v91 = "Bad path weight at index %lu";
          goto LABEL_141;
        }
        if (-[NSObject proxiesCount](v23, "proxiesCount") != 2)
        {
          nplog_obj();
          v69 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            goto LABEL_156;
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v113 = v75;
          v91 = "Bad fallback proxy count for path weight at index %lu";
          goto LABEL_141;
        }
        v76 = -[NSObject proxiesAtIndex:](v23, "proxiesAtIndex:", 0);
        v77 = -[NSObject proxiesAtIndex:](v23, "proxiesAtIndex:", 1);
        if (objc_msgSend(v4, "proxiesCount") < (unint64_t)v76)
        {
          nplog_obj();
          v69 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            goto LABEL_156;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v113 = v76;
          *(_WORD *)&v113[4] = 2048;
          *(_QWORD *)&v113[6] = v75;
          v91 = "Bad fallback proxy index %u at path weight index %lu";
          goto LABEL_146;
        }
        if (objc_msgSend(v4, "proxiesCount") < (unint64_t)v77)
          break;
        objc_msgSend(v4, "proxiesAtIndex:", v76);
        v69 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject proxyHop](v69, "proxyHop") != 1)
        {
          nplog_obj();
          v70 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            goto LABEL_151;
          *(_WORD *)buf = 0;
          v99 = "first fallback proxy index in path weight should be ingress only";
          v100 = v70;
          v101 = 2;
LABEL_160:
          _os_log_error_impl(&dword_19E8FE000, v100, OS_LOG_TYPE_ERROR, v99, buf, v101);
          goto LABEL_151;
        }
        if ((-[NSObject supportsFallback](v69, "supportsFallback") & 1) == 0)
        {
          nplog_obj();
          v70 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            goto LABEL_151;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v113 = v76;
          *(_WORD *)&v113[4] = 2048;
          *(_QWORD *)&v113[6] = v75;
          v99 = "ingress fallback proxy does not have fallback capability for index %u at path weight index %lu";
          v100 = v70;
          v101 = 18;
          goto LABEL_160;
        }
        objc_msgSend(v4, "proxiesAtIndex:", v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v78, "proxyHop") != 2)
        {
          nplog_obj();
          v102 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
LABEL_155:

            goto LABEL_156;
          }
          *(_WORD *)buf = 0;
          v103 = "second fallback proxy index in path weight should be egress only";
          v104 = v102;
          v105 = 2;
LABEL_162:
          _os_log_error_impl(&dword_19E8FE000, v104, OS_LOG_TYPE_ERROR, v103, buf, v105);
          goto LABEL_155;
        }
        if ((objc_msgSend(v78, "supportsFallback") & 1) == 0)
        {
          nplog_obj();
          v102 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
            goto LABEL_155;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v113 = v77;
          *(_WORD *)&v113[4] = 2048;
          *(_QWORD *)&v113[6] = v75;
          v103 = "egress fallback proxy does not have fallback capability for index %u at path weight index %lu";
          v104 = v102;
          v105 = 18;
          goto LABEL_162;
        }

        ++v75;
        objc_msgSend(v4, "fallbackPathWeights");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "count");

        if (v75 >= v80)
          goto LABEL_94;
      }
      nplog_obj();
      v69 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        goto LABEL_156;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v113 = v77;
      *(_WORD *)&v113[4] = 2048;
      *(_QWORD *)&v113[6] = v75;
      v91 = "Bad fallback proxy index %u at path weight index %lu";
      goto LABEL_146;
    }
LABEL_94:
    if (objc_msgSend(v4, "resolversCount"))
    {
      v81 = 0;
      while (1)
      {
        objc_msgSend(v4, "resolversAtIndex:", v81);
        v23 = objc_claimAutoreleasedReturnValue();
        v82 = (void *)MEMORY[0x1E0C99E98];
        -[NSObject dohURL](v23, "dohURL");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "URLWithString:", v83);
        v69 = objc_claimAutoreleasedReturnValue();

        if (!v69)
          break;
        -[NSObject host](v69, "host");
        v84 = objc_claimAutoreleasedReturnValue();
        if (!v84)
          break;
        v85 = (void *)v84;
        -[NSObject scheme](v69, "scheme");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v86, "isEqualToString:", CFSTR("https")))
        {

        }
        else
        {
          -[NSObject scheme](v69, "scheme");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend(v87, "isEqualToString:", CFSTR("http"));

          if ((v88 & 1) == 0)
            break;
        }

        ++v81;
        v15 = 1;
        if (v81 >= objc_msgSend(v4, "resolversCount"))
          goto LABEL_35;
      }
      nplog_obj();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v113 = v69;
        v93 = "Bad resolver url format %@";
        v94 = v92;
        v95 = 12;
        goto LABEL_158;
      }
LABEL_130:

      goto LABEL_156;
    }
    v15 = 1;
    goto LABEL_35;
  }
  v66 = 0;
  while (2)
  {
    objc_msgSend(v4, "pathWeightsAtIndex:", v66);
    v23 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject weight](v23, "weight") >= 0x65)
    {
      nplog_obj();
      v69 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        goto LABEL_156;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v113 = v66;
      v91 = "Bad path weight at index %lu";
LABEL_141:
      v97 = v69;
      v98 = 12;
      goto LABEL_147;
    }
    if (-[NSObject proxiesCount](v23, "proxiesCount") != 2)
    {
      nplog_obj();
      v69 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        goto LABEL_156;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v113 = v66;
      v91 = "Bad proxy count for path weight at index %lu";
      goto LABEL_141;
    }
    v67 = -[NSObject proxiesAtIndex:](v23, "proxiesAtIndex:", 0);
    v68 = -[NSObject proxiesAtIndex:](v23, "proxiesAtIndex:", 1);
    if (objc_msgSend(v4, "proxiesCount") < (unint64_t)v67)
    {
      nplog_obj();
      v69 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        goto LABEL_156;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v113 = v67;
      *(_WORD *)&v113[4] = 2048;
      *(_QWORD *)&v113[6] = v66;
      v91 = "Bad proxy index %u at path weight index %lu";
      goto LABEL_146;
    }
    if (objc_msgSend(v4, "proxiesCount") >= (unint64_t)v68)
    {
      objc_msgSend(v4, "proxiesAtIndex:", v67);
      v69 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject proxyHop](v69, "proxyHop") != 1)
      {
        nplog_obj();
        v92 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          goto LABEL_130;
        *(_WORD *)buf = 0;
        v93 = "first proxy index in path weight should be ingress only";
        v94 = v92;
        v95 = 2;
LABEL_158:
        _os_log_error_impl(&dword_19E8FE000, v94, OS_LOG_TYPE_ERROR, v93, buf, v95);
        goto LABEL_130;
      }
      objc_msgSend(v4, "proxiesAtIndex:", v68);
      v70 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject proxyHop](v70, "proxyHop") != 2)
      {
        nplog_obj();
        v96 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19E8FE000, v96, OS_LOG_TYPE_ERROR, "second proxy index in path weight should be egress only", buf, 2u);
        }

LABEL_151:
        goto LABEL_156;
      }

      ++v66;
      objc_msgSend(v4, "pathWeights");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "count");

      if (v66 >= v72)
        goto LABEL_83;
      continue;
    }
    break;
  }
  nplog_obj();
  v69 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    goto LABEL_156;
  *(_DWORD *)buf = 67109376;
  *(_DWORD *)v113 = v68;
  *(_WORD *)&v113[4] = 2048;
  *(_QWORD *)&v113[6] = v66;
  v91 = "Bad proxy index %u at path weight index %lu";
LABEL_146:
  v97 = v69;
  v98 = 18;
LABEL_147:
  _os_log_error_impl(&dword_19E8FE000, v97, OS_LOG_TYPE_ERROR, v91, buf, v98);
LABEL_156:

LABEL_33:
LABEL_34:
  v15 = 0;
LABEL_35:

LABEL_36:
  return v15;
}

+ (void)verifyConfigurationSignature:(id)a3 configuration:(id)a4 host:(id)a5 validateCert:(BOOL)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  const __CFAllocator *v19;
  uint64_t v20;
  SecCertificateRef v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  const void *v25;
  NSObject *v26;
  const void *ApplePinned;
  void *v28;
  const void *v29;
  OSStatus v30;
  __SecTrust *v31;
  id v32;
  NSObject *v33;
  id v34;
  OSStatus v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  uint8_t *v40;
  NSObject *v41;
  uint32_t v42;
  NSObject *v43;
  __int128 v44;
  _BOOL4 v46;
  id v47;
  id v48;
  id v49;
  _QWORD result[4];
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[4];
  OSStatus v61;
  _BYTE buf[24];
  _BYTE v63[128];
  uint64_t v64;

  v46 = a6;
  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v49 = a7;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v10, "certificates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v57;
    v19 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    *(_QWORD *)&v16 = 138412290;
    v44 = v16;
    v47 = v12;
    v48 = v11;
    while (2)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v57 != v18)
          objc_enumerationMutation(v14);
        v21 = SecCertificateCreateWithData(v19, *(CFDataRef *)(*((_QWORD *)&v56 + 1) + 8 * v20));
        nplog_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (!v21)
        {
          v12 = v47;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_ERROR, "SecCertificateCreateWithData failed", buf, 2u);
          }

          v11 = v48;
          goto LABEL_32;
        }
        v24 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

        if (v24)
        {
          CFAbsoluteTimeGetCurrent();
          v25 = (const void *)SecCertificateCopySummaryProperties();
          nplog_obj();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v44;
            *(_QWORD *)&buf[4] = v25;
            _os_log_debug_impl(&dword_19E8FE000, v26, OS_LOG_TYPE_DEBUG, "Certificate Properties:\n%@", buf, 0xCu);
          }

          if (v25)
            CFRelease(v25);
        }
        if (+[NPUtilities certificateDateIsValid:](NPUtilities, "certificateDateIsValid:", v21, v44) != 1)
        {
          nplog_obj();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19E8FE000, v37, OS_LOG_TYPE_ERROR, "Certificate did not fall within valid dates", buf, 2u);
          }

          CFRelease(v21);
          v12 = v47;
          v11 = v48;
LABEL_32:
          v28 = v49;
          (*((void (**)(id, _QWORD))v49 + 2))(v49, 0);

          goto LABEL_48;
        }
        objc_msgSend(v13, "addObject:", v21);
        CFRelease(v21);
        ++v20;
      }
      while (v17 != v20);
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      v12 = v47;
      v11 = v48;
      if (v17)
        continue;
      break;
    }
  }

  if (!objc_msgSend(v13, "count"))
  {
    nplog_obj();
    v38 = objc_claimAutoreleasedReturnValue();
    v28 = v49;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v38, OS_LOG_TYPE_ERROR, "No valid certificates to verify signed configuration", buf, 2u);
    }
    goto LABEL_35;
  }
  ApplePinned = (const void *)SecPolicyCreateApplePinned();
  v28 = v49;
  if (!ApplePinned)
  {
    nplog_obj();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v12;
    v39 = "SecPolicyCreateApplePinned failed for %@ host";
    v40 = buf;
    v41 = v38;
    v42 = 12;
LABEL_50:
    _os_log_error_impl(&dword_19E8FE000, v41, OS_LOG_TYPE_ERROR, v39, v40, v42);
LABEL_35:

    (*((void (**)(id, _QWORD))v49 + 2))(v49, 0);
    goto LABEL_48;
  }
  v29 = ApplePinned;
  *(_QWORD *)buf = 0;
  v30 = SecTrustCreateWithCertificates(v13, ApplePinned, (SecTrustRef *)buf);
  v31 = *(__SecTrust **)buf;
  if (v30 || !*(_QWORD *)buf)
  {
    if (*(_QWORD *)buf)
    {
      CFRelease(*(CFTypeRef *)buf);
      *(_QWORD *)buf = 0;
    }
    CFRelease(v29);
    nplog_obj();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    *(_WORD *)v60 = 0;
    v39 = "SecTrustCreateWithCertificates failed";
    v40 = v60;
    v41 = v38;
    v42 = 2;
    goto LABEL_50;
  }
  if (!v46)
  {
    nplog_obj();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v60 = 0;
      _os_log_impl(&dword_19E8FE000, v43, OS_LOG_TYPE_INFO, "Ignoring validation for Signed configuration", v60, 2u);
    }

    (*((void (**)(id, uint64_t))v49 + 2))(v49, 1);
    if (*(_QWORD *)buf)
    {
      CFRelease(*(CFTypeRef *)buf);
      *(_QWORD *)buf = 0;
    }
    goto LABEL_47;
  }
  v32 = v12;
  NPGetInternalQueue();
  v33 = objc_claimAutoreleasedReturnValue();
  result[0] = MEMORY[0x1E0C809B0];
  result[1] = 3221225472;
  result[2] = __99__NSPConfiguration_verifyConfigurationSignature_configuration_host_validateCert_completionHandler___block_invoke;
  result[3] = &unk_1E41388C0;
  v54 = *(_QWORD *)buf;
  v55 = a1;
  v51 = v10;
  v52 = v11;
  v34 = v49;
  v53 = v34;
  v35 = SecTrustEvaluateAsyncWithError(v31, v33, result);

  if (!v35)
  {

    v12 = v32;
LABEL_47:
    CFRelease(v29);
    goto LABEL_48;
  }
  nplog_obj();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v60 = 67109120;
    v61 = v35;
    _os_log_error_impl(&dword_19E8FE000, v36, OS_LOG_TYPE_ERROR, "SecTrustEvaluateAsync returned an error: %d", v60, 8u);
  }

  if (*(_QWORD *)buf)
  {
    CFRelease(*(CFTypeRef *)buf);
    *(_QWORD *)buf = 0;
  }
  (*((void (**)(id, _QWORD))v34 + 2))(v34, 0);

  v12 = v32;
LABEL_48:

}

void __99__NSPConfiguration_verifyConfigurationSignature_configuration_host_validateCert_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  NSObject *v7;
  NSObject *v8;
  __SecKey *v9;
  void *v10;
  id v11;
  const __CFData *v12;
  const __CFString *v13;
  const __CFData *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  const void *v21;
  uint64_t v22;
  const char *v23;
  _BYTE cf[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)cf = 138412290;
      *(_QWORD *)&cf[4] = a4;
      _os_log_error_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_ERROR, "SecTrustEvaluateAsyncWithError failed with %@", cf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_26;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)cf = 0;
    _os_log_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_INFO, "SecTrustEvaluateAsyncWithError success", cf, 2u);
  }

  v9 = SecTrustCopyKey(*(SecTrustRef *)(a1 + 56));
  if (v9)
  {
    v10 = *(void **)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    v12 = v10;
    objc_opt_self();
    if (v11)
    {
      if (v12)
      {
        if (objc_msgSend(v11, "signatureAlgorithm") == 1)
        {
          *(_QWORD *)cf = 0;
          v13 = (const __CFString *)*MEMORY[0x1E0CD6DF8];
          objc_msgSend(v11, "signature");
          v14 = (const __CFData *)objc_claimAutoreleasedReturnValue();
          v15 = SecKeyVerifySignature(v9, v13, v12, v14, (CFErrorRef *)cf);

          if (*(_QWORD *)cf)
            CFRelease(*(CFTypeRef *)cf);

          if (v15 == 1)
          {
            nplog_obj();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)cf = 0;
              _os_log_impl(&dword_19E8FE000, v16, OS_LOG_TYPE_INFO, "Configuration Signature validated", cf, 2u);
            }

            nplog_large_obj();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)cf = 138412290;
              *(_QWORD *)&cf[4] = v18;
              _os_log_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_INFO, "Validated configuration %@", cf, 0xCu);
            }

            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_25:
            CFRelease(v9);
            goto LABEL_26;
          }
          goto LABEL_22;
        }
        nplog_obj();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v22 = objc_msgSend(v11, "signatureAlgorithm");
          *(_DWORD *)cf = 134217984;
          *(_QWORD *)&cf[4] = v22;
          _os_log_error_impl(&dword_19E8FE000, v19, OS_LOG_TYPE_ERROR, "validate signature, bad signature algorithm: %lu", cf, 0xCu);
        }
        goto LABEL_21;
      }
      nplog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)cf = 136315138;
        *(_QWORD *)&cf[4] = "+[NSPConfiguration validateSignature:publicKey:signedData:]";
        v23 = "%s called with null signedData";
        goto LABEL_33;
      }
    }
    else
    {
      nplog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)cf = 136315138;
        *(_QWORD *)&cf[4] = "+[NSPConfiguration validateSignature:publicKey:signedData:]";
        v23 = "%s called with null signatureInfo";
LABEL_33:
        _os_log_fault_impl(&dword_19E8FE000, v19, OS_LOG_TYPE_FAULT, v23, cf, 0xCu);
      }
    }
LABEL_21:

  }
LABEL_22:
  nplog_obj();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)cf = 0;
    _os_log_error_impl(&dword_19E8FE000, v20, OS_LOG_TYPE_ERROR, "Configuration Signature failed validation", cf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (v9)
    goto LABEL_25;
LABEL_26:
  v21 = *(const void **)(a1 + 56);
  if (v21)
  {
    CFRelease(v21);
    *(_QWORD *)(a1 + 56) = 0;
  }
}

- (BOOL)saveToPreferences
{
  void *v3;
  NSPPrivacyProxyConfiguration *v4;
  NSPPrivacyProxyConfiguration *proxyConfiguration;
  NSPPrivacyProxyConfiguration *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  const char *v12;
  uint8_t *v13;
  uint8_t v15[16];
  uint8_t buf[2];
  __int16 v17;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  if (!v3)
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      v11 = 0;
      goto LABEL_9;
    }
    v17 = 0;
    v12 = "NSKeyedArchiver initialize failed";
    v13 = (uint8_t *)&v17;
LABEL_11:
    _os_log_error_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_8;
  }
  v4 = self->_proxyConfiguration;
  proxyConfiguration = self->_proxyConfiguration;
  self->_proxyConfiguration = 0;

  -[NSPConfiguration encodeWithCoder:](self, "encodeWithCoder:", v3);
  v6 = self->_proxyConfiguration;
  self->_proxyConfiguration = v4;

  v7 = (const __CFString *)*MEMORY[0x1E0C9B248];
  _CFPreferencesSetFileProtectionClass();
  objc_msgSend(v3, "encodedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("NSPConfiguration"), v8, v7);

  LODWORD(v8) = CFPreferencesAppSynchronize(v7);
  nplog_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!(_DWORD)v8)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v12 = "Failed to write nsp configuration to preference file";
    v13 = buf;
    goto LABEL_11;
  }
  v11 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_INFO, "Saved configuration to preference file", v15, 2u);
  }
LABEL_9:

  return v11;
}

- (id)initFromPreferences
{
  CFPropertyListRef v3;
  const void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  NSPConfiguration *v10;
  NSPConfiguration *v11;
  NSPConfiguration *v12;
  unint64_t diskVersion;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSNumber *v20;
  NSNumber *proxyTrafficState;
  int64_t v23;
  objc_super v24;
  id v25;
  uint8_t buf[4];
  int64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = CFPreferencesCopyAppValue(CFSTR("NSPConfiguration"), (CFStringRef)*MEMORY[0x1E0C9B248]);
  if (v3)
  {
    v4 = v3;
    v25 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v25);
    v6 = v25;
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 0;
    if (!v8)
    {
      nplog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = (int64_t)v7;
        _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the NSP configuration: %@", buf, 0xCu);
      }

      CFRelease(v4);
LABEL_9:
      v10 = 0;
LABEL_46:

      goto LABEL_47;
    }
    CFRelease(v4);
    v24.receiver = self;
    v24.super_class = (Class)NSPConfiguration;
    v11 = -[NSPConfiguration init](&v24, sel_init);
    if (v11)
    {
      v12 = -[NSPConfiguration initWithCoder:](v11, "initWithCoder:", v5);
      if (!v12)
      {
        nplog_obj();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_ERROR, "Failed to decode the NSP configuration", buf, 2u);
        }

        self = 0;
        goto LABEL_9;
      }
      self = v12;
      diskVersion = v12->_diskVersion;
      if (diskVersion - 20 <= 0xFFFFFFFFFFFFFFF4)
      {
        nplog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v23 = self->_diskVersion;
          *(_DWORD *)buf = 134218240;
          v27 = v23;
          v28 = 2048;
          v29 = 19;
          _os_log_error_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_ERROR, "Saved disk version of configuration (%ld) does not match latest supported version (%ld)", buf, 0x16u);
        }

        goto LABEL_9;
      }
      if (diskVersion <= 9)
        objc_storeStrong((id *)&v12->_userPreferredTier, v12->_userTier);
      v16 = -[NSNumber unsignedLongLongValue](self->_proxyTrafficState, "unsignedLongLongValue");
      v17 = self->_diskVersion;
      v18 = v16 | 0x7000;
      if (v17 >= 11)
        v18 = v16;
      if (v17 < 12)
        v18 |= 0x8000uLL;
      if (v17 < 13)
        v18 |= 0x10000uLL;
      if (v17 < 14)
        v18 |= 0x1C0000uLL;
      if (v17 < 15)
        v18 |= 0x200000uLL;
      if (v17 < 16)
        v18 |= 0x400000uLL;
      if (v17 < 17)
        v18 |= 0x800000uLL;
      if (v17 < 18)
        v18 |= 0x1000000uLL;
      if (v17 >= 19)
        v19 = v18;
      else
        v19 = v18 | 0x2000000;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19);
      v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      proxyTrafficState = self->_proxyTrafficState;
      self->_proxyTrafficState = v20;

    }
    else
    {
      self = 0;
    }
    self = self;
    v10 = self;
    goto LABEL_46;
  }
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_INFO, "no saved configuration", buf, 2u);
  }
  v10 = 0;
LABEL_47:

  return v10;
}

- (id)tierToString
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  -[NSPConfiguration userTier](self, "userTier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");
  if (v3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E4138928[(int)v3];
  }

  return v4;
}

- (BOOL)fetchDateIsWithinStart:(id)a3 end:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSPConfiguration configurationFetchDate](self, "configurationFetchDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    nplog_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[NSPConfiguration etag](self, "etag");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v21;
      _os_log_error_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_ERROR, "Configuration (etag %@) has no fetch time, so cannot check validity", (uint8_t *)&v22, 0xCu);

    }
    goto LABEL_7;
  }
  objc_msgSend(v8, "timeIntervalSinceDate:", v6);
  v11 = v10;
  objc_msgSend(v7, "timeIntervalSinceDate:", v9);
  v13 = v12;
  if (v11 < 0.0 || v12 < 0.0)
  {
    if (v11 < 0.0 && v11 > -600.0)
    {
      nplog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        v16 = "Configuration fetch date before start, but within 10 minute grace period";
LABEL_16:
        _os_log_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    nplog_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    v15 = v17;
    if (v13 < 0.0 && v13 > -600.0)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        v16 = "Configuration fetch date after end, but within 10 minute grace period";
        goto LABEL_16;
      }
LABEL_17:
      v14 = 1;
      goto LABEL_18;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[NSPConfiguration configurationFetchDate](self, "configurationFetchDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSPConfiguration etag](self, "etag");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138413058;
      v23 = v19;
      v24 = 2112;
      v25 = v20;
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      _os_log_error_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_ERROR, "Configuration fetch time %@ (etag %@) is not within start time (%@) and end time (%@)", (uint8_t *)&v22, 0x2Au);

    }
LABEL_7:
    v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)timestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSNumber)enabled
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEnabled:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)etag
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEtag:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSNumber)epoch
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEpoch:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSDate)resurrectionDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResurrectionDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSArray)appRules
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAppRules:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSNumber)configServerEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConfigServerEnabled:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSNumber)configServerPort
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConfigServerPort:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSString)configServerPath
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConfigServerPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSNumber)urlRequestTimeout
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUrlRequestTimeout:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSString)waldoLeafOID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWaldoLeafOID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSNumber)waldoRevocationFailClosed
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setWaldoRevocationFailClosed:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSURLSession)privacyProxyURLSession
{
  return self->_privacyProxyURLSession;
}

- (void)setPrivacyProxyURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_privacyProxyURLSession, a3);
}

- (BOOL)ignoreInvalidCerts
{
  return self->_ignoreInvalidCerts;
}

- (void)setIgnoreInvalidCerts:(BOOL)a3
{
  self->_ignoreInvalidCerts = a3;
}

- (NSDictionary)edgeSets
{
  return self->_edgeSets;
}

- (void)setEdgeSets:(id)a3
{
  objc_storeStrong((id *)&self->_edgeSets, a3);
}

- (NSNumber)persistMetrics
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPersistMetrics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSPPrivacyProxyConfiguration)proxyConfiguration
{
  return (NSPPrivacyProxyConfiguration *)objc_getProperty(self, a2, 152, 1);
}

- (void)setProxyConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSData)proxyConfigurationData
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setProxyConfigurationData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (void)setUserTier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setProxyTrafficState:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (NSDate)configurationFetchDate
{
  return (NSDate *)objc_getProperty(self, a2, 184, 1);
}

- (void)setConfigurationFetchDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (NSDate)resetTomorrowDate
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (void)setResetTomorrowDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (NSDate)anyAppEnabledDate
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setAnyAppEnabledDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (void)setWillResetSubscriberTierTomorrow:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (NSNumber)cloudSubscriptionCheckEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setCloudSubscriptionCheckEnabled:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (NSNumber)geohashSharingEnabledStatus
{
  return self->_geohashSharingEnabledStatus;
}

- (void)setGeohashSharingEnabledStatus:(id)a3
{
  objc_storeStrong((id *)&self->_geohashSharingEnabledStatus, a3);
}

- (NSString)geohashOverride
{
  return self->_geohashOverride;
}

- (void)setGeohashOverride:(id)a3
{
  objc_storeStrong((id *)&self->_geohashOverride, a3);
}

- (NSNumber)preferredPathRoutingEnabledStatus
{
  return self->_preferredPathRoutingEnabledStatus;
}

- (void)setPreferredPathRoutingEnabledStatus:(id)a3
{
  objc_storeStrong((id *)&self->_preferredPathRoutingEnabledStatus, a3);
}

- (NSNumber)privateAccessTokensEnabledStatus
{
  return self->_privateAccessTokensEnabledStatus;
}

- (void)setPrivateAccessTokensEnabledStatus:(id)a3
{
  objc_storeStrong((id *)&self->_privateAccessTokensEnabledStatus, a3);
}

- (NSNumber)privateAccessTokensAllowTools
{
  return self->_privateAccessTokensAllowTools;
}

- (void)setPrivateAccessTokensAllowTools:(id)a3
{
  objc_storeStrong((id *)&self->_privateAccessTokensAllowTools, a3);
}

- (NSNumber)inProcessFlowDivert
{
  return self->_inProcessFlowDivert;
}

- (void)setInProcessFlowDivert:(id)a3
{
  objc_storeStrong((id *)&self->_inProcessFlowDivert, a3);
}

- (void)setProxyAccountType:(id)a3
{
  objc_storeStrong((id *)&self->_proxyAccountType, a3);
}

- (void)setProxyAccountUnlimited:(id)a3
{
  objc_storeStrong((id *)&self->_proxyAccountUnlimited, a3);
}

- (NSNumber)userPreferredTier
{
  return self->_userPreferredTier;
}

- (void)setUserPreferredTier:(id)a3
{
  objc_storeStrong((id *)&self->_userPreferredTier, a3);
}

- (NSNumber)subscriberEnabledFromNonSettingsApp
{
  return self->_subscriberEnabledFromNonSettingsApp;
}

- (void)setSubscriberEnabledFromNonSettingsApp:(id)a3
{
  objc_storeStrong((id *)&self->_subscriberEnabledFromNonSettingsApp, a3);
}

- (NSNumber)trialConfigVersion
{
  return self->_trialConfigVersion;
}

- (void)setTrialConfigVersion:(id)a3
{
  objc_storeStrong((id *)&self->_trialConfigVersion, a3);
}

- (NSString)lastPrivateCloudComputeEnvironment
{
  return self->_lastPrivateCloudComputeEnvironment;
}

- (void)setLastPrivateCloudComputeEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_lastPrivateCloudComputeEnvironment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_lastPrivateCloudComputeEnvironment, 0);
  objc_storeStrong((id *)&self->_trialConfigVersion, 0);
  objc_storeStrong((id *)&self->_subscriberEnabledFromNonSettingsApp, 0);
  objc_storeStrong((id *)&self->_userPreferredTier, 0);
  objc_storeStrong((id *)&self->_proxyAccountUnlimited, 0);
  objc_storeStrong((id *)&self->_proxyAccountType, 0);
  objc_storeStrong((id *)&self->_inProcessFlowDivert, 0);
  objc_storeStrong((id *)&self->_privateAccessTokensAllowTools, 0);
  objc_storeStrong((id *)&self->_privateAccessTokensEnabledStatus, 0);
  objc_storeStrong((id *)&self->_preferredPathRoutingEnabledStatus, 0);
  objc_storeStrong((id *)&self->_geohashOverride, 0);
  objc_storeStrong((id *)&self->_geohashSharingEnabledStatus, 0);
  objc_storeStrong((id *)&self->_cloudSubscriptionCheckEnabled, 0);
  objc_storeStrong((id *)&self->_willResetSubscriberTierTomorrow, 0);
  objc_storeStrong((id *)&self->_anyAppEnabledDate, 0);
  objc_storeStrong((id *)&self->_resetTomorrowDate, 0);
  objc_storeStrong((id *)&self->_configurationFetchDate, 0);
  objc_storeStrong((id *)&self->_proxyTrafficState, 0);
  objc_storeStrong((id *)&self->_userTier, 0);
  objc_storeStrong((id *)&self->_proxyConfigurationData, 0);
  objc_storeStrong((id *)&self->_proxyConfiguration, 0);
  objc_storeStrong((id *)&self->_persistMetrics, 0);
  objc_storeStrong((id *)&self->_edgeSets, 0);
  objc_storeStrong((id *)&self->_privacyProxyURLSession, 0);
  objc_storeStrong((id *)&self->_waldoRevocationFailClosed, 0);
  objc_storeStrong((id *)&self->_waldoLeafOID, 0);
  objc_storeStrong((id *)&self->_urlRequestTimeout, 0);
  objc_storeStrong((id *)&self->_configServerPath, 0);
  objc_storeStrong((id *)&self->_configServerPort, 0);
  objc_storeStrong((id *)&self->_configServerEnabled, 0);
  objc_storeStrong((id *)&self->_appRules, 0);
  objc_storeStrong((id *)&self->_resurrectionDate, 0);
  objc_storeStrong((id *)&self->_epoch, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_configServerHost, 0);
}

@end
