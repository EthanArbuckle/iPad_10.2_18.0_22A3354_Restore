@implementation DNDMutableConfiguration

+ (id)defaultConfiguration
{
  return +[DNDMutableConfiguration configurationOfType:](DNDMutableConfiguration, "configurationOfType:", +[DNDConfiguration defaultConfigurationType](DNDConfiguration, "defaultConfigurationType"));
}

+ (id)configurationOfType:(unint64_t)a3
{
  return -[DNDConfiguration _initWithConfigurationType:]([DNDMutableConfiguration alloc], "_initWithConfigurationType:", a3);
}

- (void)setSuppressionType:(unint64_t)a3
{
  self->super._suppressionType = a3;
}

- (void)setSuppressionMode:(unint64_t)a3
{
  self->super._suppressionMode = a3;
}

- (void)setApplicationConfigurationType:(unint64_t)a3
{
  self->super._applicationConfigurationType = a3;
}

- (void)setSenderConfigurationType:(unint64_t)a3
{
  self->super._senderConfigurationType = a3;
}

- (void)setAllowedApplicationIdentifiers:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *allowedApplicationIdentifiers;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  allowedApplicationIdentifiers = self->super._allowedApplicationIdentifiers;
  self->super._allowedApplicationIdentifiers = v4;

}

- (void)setDeniedApplicationIdentifiers:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *deniedApplicationIdentifiers;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  deniedApplicationIdentifiers = self->super._deniedApplicationIdentifiers;
  self->super._deniedApplicationIdentifiers = v4;

}

- (void)setAllowedWebApplicationIdentifiers:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *allowedWebApplicationIdentifiers;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  allowedWebApplicationIdentifiers = self->super._allowedWebApplicationIdentifiers;
  self->super._allowedWebApplicationIdentifiers = v4;

}

- (void)setDeniedWebApplicationIdentifiers:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *deniedWebApplicationIdentifiers;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  deniedWebApplicationIdentifiers = self->super._deniedWebApplicationIdentifiers;
  self->super._deniedWebApplicationIdentifiers = v4;

}

- (void)setAllowedApplications:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *allowedApplicationIdentifiers;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  DNDApplicationIdentifier *v13;
  DNDApplicationIdentifier *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  allowedApplicationIdentifiers = self->super._allowedApplicationIdentifiers;
  self->super._allowedApplicationIdentifiers = v5;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v13 = [DNDApplicationIdentifier alloc];
        v14 = -[DNDApplicationIdentifier initWithBundleID:](v13, "initWithBundleID:", v12, (_QWORD)v16);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._allowedApplicationIdentifiers, "setObject:forKeyedSubscript:", v15, v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)setDeniedApplications:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *deniedApplicationIdentifiers;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  DNDApplicationIdentifier *v13;
  DNDApplicationIdentifier *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  deniedApplicationIdentifiers = self->super._deniedApplicationIdentifiers;
  self->super._deniedApplicationIdentifiers = v5;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        v13 = [DNDApplicationIdentifier alloc];
        v14 = -[DNDApplicationIdentifier initWithBundleID:](v13, "initWithBundleID:", v12, (_QWORD)v15);
        -[NSMutableSet addObject:](self->super._deniedApplicationIdentifiers, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)setSenderConfiguration:(id)a3
{
  DNDMutableSenderConfiguration *v4;
  DNDMutableSenderConfiguration *senderConfiguration;

  v4 = (DNDMutableSenderConfiguration *)objc_msgSend(a3, "mutableCopy");
  senderConfiguration = self->super._senderConfiguration;
  self->super._senderConfiguration = v4;

}

- (void)setMinimumBreakthroughUrgency:(unint64_t)a3
{
  self->super._minimumBreakthroughUrgency = a3;
}

- (void)setHideApplicationBadges:(unint64_t)a3
{
  self->super._hideApplicationBadges = a3;
}

- (void)setAllowIntelligentManagement:(unint64_t)a3
{
  self->super._allowIntelligentManagement = a3;
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->super._compatibilityVersion = a3;
}

- (void)setExceptionForApplication:(id)a3
{
  id v4;
  DNDApplicationIdentifier *v5;

  v4 = a3;
  v5 = -[DNDApplicationIdentifier initWithBundleID:]([DNDApplicationIdentifier alloc], "initWithBundleID:", v4);

  -[DNDMutableConfiguration setExceptionForApplicationIdentifier:](self, "setExceptionForApplicationIdentifier:", v5);
}

- (void)setExceptionForApplicationIdentifier:(id)a3
{
  unint64_t v4;
  NSMutableDictionary *allowedApplicationIdentifiers;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[DNDConfiguration applicationConfigurationType](self, "applicationConfigurationType");
  if (v4 == 1)
  {
    -[NSMutableDictionary removeObjectForKey:](self->super._allowedApplicationIdentifiers, "removeObjectForKey:", v7);
    -[NSMutableSet addObject:](self->super._deniedApplicationIdentifiers, "addObject:", v7);
  }
  else if (!v4)
  {
    -[NSMutableSet removeObject:](self->super._deniedApplicationIdentifiers, "removeObject:", v7);
    allowedApplicationIdentifiers = self->super._allowedApplicationIdentifiers;
    +[DNDApplicationConfiguration defaultConfiguration](DNDApplicationConfiguration, "defaultConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](allowedApplicationIdentifiers, "setObject:forKey:", v6, v7);

  }
}

- (void)removeExceptionForApplication:(id)a3
{
  id v4;
  DNDApplicationIdentifier *v5;

  v4 = a3;
  v5 = -[DNDApplicationIdentifier initWithBundleID:]([DNDApplicationIdentifier alloc], "initWithBundleID:", v4);

  -[DNDMutableConfiguration removeExceptionForApplicationIdentifier:](self, "removeExceptionForApplicationIdentifier:", v5);
}

- (void)removeExceptionForApplicationIdentifier:(id)a3
{
  NSMutableDictionary *allowedApplicationIdentifiers;
  id v5;

  allowedApplicationIdentifiers = self->super._allowedApplicationIdentifiers;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](allowedApplicationIdentifiers, "removeObjectForKey:", v5);
  -[NSMutableSet removeObject:](self->super._deniedApplicationIdentifiers, "removeObject:", v5);

}

- (void)setExceptionForApplication:(id)a3 thread:(id)a4
{
  id v6;
  id v7;
  DNDApplicationIdentifier *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[DNDApplicationIdentifier initWithBundleID:]([DNDApplicationIdentifier alloc], "initWithBundleID:", v7);

  -[DNDMutableConfiguration setExceptionForApplicationIdentifier:thread:](self, "setExceptionForApplicationIdentifier:thread:", v8, v6);
}

- (void)setExceptionForApplicationIdentifier:(id)a3 thread:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[DNDMutableConfiguration _configurationForApplicationIdentifier:](self, "_configurationForApplicationIdentifier:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = -[DNDConfiguration threadConfigurationType](self, "threadConfigurationType");
  if (v9 == 1)
  {
    objc_msgSend(v8, "allowedThreads");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v6);

    objc_msgSend(v8, "deniedThreads");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v9)
  {
    objc_msgSend(v8, "deniedThreads");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v6);

    objc_msgSend(v8, "allowedThreads");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = v11;
    objc_msgSend(v11, "addObject:", v6);

  }
  -[NSMutableDictionary setObject:forKey:](self->super._allowedApplicationIdentifiers, "setObject:forKey:", v8, v14);

}

- (void)removeExceptionForApplication:(id)a3 thread:(id)a4
{
  id v6;
  id v7;
  DNDApplicationIdentifier *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[DNDApplicationIdentifier initWithBundleID:]([DNDApplicationIdentifier alloc], "initWithBundleID:", v7);

  -[DNDMutableConfiguration removeExceptionForApplicationIdentifier:thread:](self, "removeExceptionForApplicationIdentifier:thread:", v8, v6);
}

- (void)removeExceptionForApplicationIdentifier:(id)a3 thread:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[DNDMutableConfiguration _configurationForApplicationIdentifier:](self, "_configurationForApplicationIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v11, "allowedThreads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v6);

  objc_msgSend(v11, "deniedThreads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v6);

  -[NSMutableDictionary setObject:forKey:](self->super._allowedApplicationIdentifiers, "setObject:forKey:", v11, v7);
}

- (void)setExceptionForWebApplicationIdentifier:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = -[DNDConfiguration applicationConfigurationType](self, "applicationConfigurationType");
  if (!v4)
  {
    v5 = 40;
    v6 = 48;
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = 48;
    v6 = 40;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v6), "removeObject:", v7);
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v5), "addObject:", v7);
  }

}

- (void)removeExceptionForWebApplicationIdentifier:(id)a3
{
  NSMutableSet *allowedWebApplicationIdentifiers;
  id v5;

  allowedWebApplicationIdentifiers = self->super._allowedWebApplicationIdentifiers;
  v5 = a3;
  -[NSMutableSet removeObject:](allowedWebApplicationIdentifiers, "removeObject:", v5);
  -[NSMutableSet removeObject:](self->super._deniedWebApplicationIdentifiers, "removeObject:", v5);

}

- (void)setExceptionForContactType:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType");
  if (v5 == 1)
  {
    -[DNDSenderConfiguration allowedContactTypes](self->super._senderConfiguration, "allowedContactTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v10);

    -[DNDSenderConfiguration deniedContactTypes](self->super._senderConfiguration, "deniedContactTypes");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
      return;
    -[DNDSenderConfiguration deniedContactTypes](self->super._senderConfiguration, "deniedContactTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v7);

    -[DNDSenderConfiguration allowedContactTypes](self->super._senderConfiguration, "allowedContactTypes");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (id)v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v11);

}

- (void)removeExceptionForContactType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[DNDSenderConfiguration allowedContactTypes](self->super._senderConfiguration, "allowedContactTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  -[DNDSenderConfiguration deniedContactTypes](self->super._senderConfiguration, "deniedContactTypes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

}

- (void)setExceptionForContactGroup:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType");
  if (v4 == 1)
  {
    -[DNDSenderConfiguration allowedContactGroups](self->super._senderConfiguration, "allowedContactGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v9);

    -[DNDSenderConfiguration deniedContactGroups](self->super._senderConfiguration, "deniedContactGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v4)
  {
    -[DNDSenderConfiguration deniedContactGroups](self->super._senderConfiguration, "deniedContactGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v9);

    -[DNDSenderConfiguration allowedContactGroups](self->super._senderConfiguration, "allowedContactGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = v6;
    objc_msgSend(v6, "addObject:", v9);

  }
}

- (void)removeExceptionForContactGroup:(id)a3
{
  DNDMutableSenderConfiguration *senderConfiguration;
  id v5;
  void *v6;
  id v7;

  senderConfiguration = self->super._senderConfiguration;
  v5 = a3;
  -[DNDSenderConfiguration allowedContactGroups](senderConfiguration, "allowedContactGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  -[DNDSenderConfiguration deniedContactGroups](self->super._senderConfiguration, "deniedContactGroups");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v5);

}

- (void)setExceptionForContact:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType");
  if (v4 == 1)
  {
    -[DNDMutableSenderConfiguration removeAllowedContactMatchingContact:](self->super._senderConfiguration, "removeAllowedContactMatchingContact:", v7);
    -[DNDSenderConfiguration deniedContacts](self->super._senderConfiguration, "deniedContacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v4)
  {
    -[DNDMutableSenderConfiguration removeDeniedContactMatchingContact:](self->super._senderConfiguration, "removeDeniedContactMatchingContact:", v7);
    -[DNDSenderConfiguration allowedContacts](self->super._senderConfiguration, "allowedContacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v5;
    objc_msgSend(v5, "addObject:", v7);

  }
}

- (void)removeExceptionForContact:(id)a3
{
  DNDMutableSenderConfiguration *senderConfiguration;
  id v5;

  senderConfiguration = self->super._senderConfiguration;
  v5 = a3;
  -[DNDMutableSenderConfiguration removeAllowedContactMatchingContact:](senderConfiguration, "removeAllowedContactMatchingContact:", v5);
  -[DNDMutableSenderConfiguration removeDeniedContactMatchingContact:](self->super._senderConfiguration, "removeDeniedContactMatchingContact:", v5);

}

- (void)setPhoneCallBypassSettings:(id)a3
{
  -[DNDMutableSenderConfiguration setPhoneCallBypassSettings:](self->super._senderConfiguration, "setPhoneCallBypassSettings:", a3);
}

- (BOOL)hasSecureData
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  -[DNDSenderConfiguration allowedContacts](self->super._senderConfiguration, "allowedContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 1;
  -[DNDSenderConfiguration deniedContacts](self->super._senderConfiguration, "deniedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    return 1;
  -[DNDSenderConfiguration allowedContactGroups](self->super._senderConfiguration, "allowedContactGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
    return 1;
  -[DNDSenderConfiguration deniedContactGroups](self->super._senderConfiguration, "deniedContactGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
    return 1;
  -[DNDSenderConfiguration allowedContactTypes](self->super._senderConfiguration, "allowedContactTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
    return 1;
  -[DNDSenderConfiguration deniedContactTypes](self->super._senderConfiguration, "deniedContactTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  return v14
      || -[NSMutableDictionary count](self->super._allowedApplicationIdentifiers, "count")
      || -[NSMutableSet count](self->super._deniedApplicationIdentifiers, "count") != 0;
}

- (id)_configurationForApplicationIdentifier:(id)a3
{
  void *v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._allowedApplicationIdentifiers, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[DNDApplicationConfiguration defaultConfiguration](DNDApplicationConfiguration, "defaultConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setExceptionOfType:(unint64_t)a3 forApplicationIdentifier:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v6 = a4;
  v10 = v6;
  if (!a3)
  {
    v9 = -[DNDConfiguration applicationConfigurationType](self, "applicationConfigurationType");
    v7 = v10;
    if (v9)
      goto LABEL_5;
    goto LABEL_4;
  }
  v7 = v6;
  if (a3 == 1)
  {
    v8 = -[DNDConfiguration applicationConfigurationType](self, "applicationConfigurationType");
    v7 = v10;
    if (v8 == 1)
    {
LABEL_4:
      -[DNDMutableConfiguration setExceptionForApplicationIdentifier:](self, "setExceptionForApplicationIdentifier:", v10);
      v7 = v10;
    }
  }
LABEL_5:

}

- (void)setExceptionOfType:(unint64_t)a3 forApplicationIdentifier:(id)a4 thread:(id)a5
{
  id v8;
  id v9;

  v9 = a4;
  v8 = a5;
  if (!a3)
  {
    if (-[DNDConfiguration threadConfigurationType](self, "threadConfigurationType"))
      goto LABEL_5;
    goto LABEL_4;
  }
  if (a3 == 1 && -[DNDConfiguration threadConfigurationType](self, "threadConfigurationType") == 1)
LABEL_4:
    -[DNDMutableConfiguration setExceptionForApplicationIdentifier:thread:](self, "setExceptionForApplicationIdentifier:thread:", v9, v8);
LABEL_5:

}

- (void)setMinimumBreakthroughUrgency:(unint64_t)a3 forApplicationIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[DNDMutableConfiguration _configurationForApplicationIdentifier:](self, "_configurationForApplicationIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setMinimumBreakthroughUrgency:", a3);
  -[NSMutableDictionary setObject:forKey:](self->super._allowedApplicationIdentifiers, "setObject:forKey:", v8, v6);

}

- (void)setMinimumBreakthroughUrgency:(unint64_t)a3 forApplication:(id)a4
{
  id v6;
  DNDApplicationIdentifier *v7;

  v6 = a4;
  v7 = -[DNDApplicationIdentifier initWithBundleID:]([DNDApplicationIdentifier alloc], "initWithBundleID:", v6);

  -[DNDMutableConfiguration setMinimumBreakthroughUrgency:forApplicationIdentifier:](self, "setMinimumBreakthroughUrgency:forApplicationIdentifier:", a3, v7);
}

- (void)setExceptionOfType:(unint64_t)a3 forContactGroup:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v6 = a4;
  v10 = v6;
  if (!a3)
  {
    v9 = -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType");
    v7 = v10;
    if (v9)
      goto LABEL_5;
    goto LABEL_4;
  }
  v7 = v6;
  if (a3 == 1)
  {
    v8 = -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType");
    v7 = v10;
    if (v8 == 1)
    {
LABEL_4:
      -[DNDMutableConfiguration setExceptionForContactGroup:](self, "setExceptionForContactGroup:", v10);
      v7 = v10;
    }
  }
LABEL_5:

}

- (void)setExceptionOfType:(unint64_t)a3 forContactType:(unint64_t)a4
{
  if (a3)
  {
    if (a3 == 1 && -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType") == 1)
      goto LABEL_4;
  }
  else if (!-[DNDConfiguration senderConfigurationType](self, "senderConfigurationType"))
  {
LABEL_4:
    -[DNDMutableConfiguration setExceptionForContactType:](self, "setExceptionForContactType:", a4);
  }
}

- (void)setExceptionOfType:(unint64_t)a3 forContact:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v6 = a4;
  v10 = v6;
  if (!a3)
  {
    v9 = -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType");
    v7 = v10;
    if (v9)
      goto LABEL_5;
    goto LABEL_4;
  }
  v7 = v6;
  if (a3 == 1)
  {
    v8 = -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType");
    v7 = v10;
    if (v8 == 1)
    {
LABEL_4:
      -[DNDMutableConfiguration setExceptionForContact:](self, "setExceptionForContact:", v10);
      v7 = v10;
    }
  }
LABEL_5:

}

- (void)setExceptionOfType:(unint64_t)a3 forApplication:(id)a4
{
  id v6;
  DNDApplicationIdentifier *v7;

  v6 = a4;
  v7 = -[DNDApplicationIdentifier initWithBundleID:]([DNDApplicationIdentifier alloc], "initWithBundleID:", v6);

  -[DNDMutableConfiguration setExceptionOfType:forApplicationIdentifier:](self, "setExceptionOfType:forApplicationIdentifier:", a3, v7);
}

- (void)setExceptionOfType:(unint64_t)a3 forApplication:(id)a4 thread:(id)a5
{
  id v8;
  id v9;
  DNDApplicationIdentifier *v10;

  v8 = a5;
  v9 = a4;
  v10 = -[DNDApplicationIdentifier initWithBundleID:]([DNDApplicationIdentifier alloc], "initWithBundleID:", v9);

  -[DNDMutableConfiguration setExceptionOfType:forApplicationIdentifier:thread:](self, "setExceptionOfType:forApplicationIdentifier:thread:", a3, v10, v8);
}

@end
