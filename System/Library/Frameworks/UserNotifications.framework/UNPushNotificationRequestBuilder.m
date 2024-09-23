@implementation UNPushNotificationRequestBuilder

- (UNPushNotificationRequestBuilder)initWithIdentifier:(id)a3 payload:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  UNPushNotificationRequestBuilder *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSDictionary *payload;
  uint64_t v16;
  NSString *bundleIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UNPushNotificationRequestBuilder;
  v11 = -[UNPushNotificationRequestBuilder init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    payload = v11->_payload;
    v11->_payload = (NSDictionary *)v14;

    v16 = objc_msgSend(v10, "copy");
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v16;

  }
  return v11;
}

- (id)buildNotificationRequest
{
  void *v3;
  uint64_t Unique;
  void *v5;
  UNMutableNotificationContent *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  id v43;
  void *v44;
  int v45;
  BOOL v46;
  char v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v61;
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
  CFTypeRef cf;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x1E0C80C00];
  -[UNPushNotificationRequestBuilder buildSafePayload](self, "buildSafePayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5 = 0;
    goto LABEL_54;
  }
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", self->_bundleIdentifier);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "bundleURL");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
    Unique = _CFBundleCreateUnique();
  else
    Unique = 0;
  v6 = objc_alloc_init(UNMutableNotificationContent);
  -[UNMutableNotificationContent setUserInfo:](v6, "setUserInfo:", self->_payload);
  objc_msgSend(v3, "un_safeCastObjectForKey:class:", CFSTR("aps"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("alert"));
  v8 = objc_claimAutoreleasedReturnValue();
  cf = (CFTypeRef)Unique;
  v70 = (void *)v8;
  if (v8)
  {
    v9 = (void *)v8;
    v10 = objc_opt_class();
    UNSafeCast(v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[UNMutableNotificationContent setBody:](v6, "setBody:", v11);
    }
    else
    {
      v64 = v3;
      v12 = v9;
      objc_msgSend(v12, "un_safeCastObjectForKey:class:", CFSTR("body"), objc_opt_class());
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_safeCastObjectForKey:class:", CFSTR("loc-key"), objc_opt_class());
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v68 && Unique)
      {
        objc_msgSend(v12, "un_safeCastObjectForKey:class:", CFSTR("loc-args"), objc_opt_class());
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[UNLocalizedStringFactory localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:](UNLocalizedStringFactory, "localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:", v68, v14, Unique, v13);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v13;
        v13 = v15;

      }
      -[UNMutableNotificationContent setBody:](v6, "setBody:", v13);
      objc_msgSend(v12, "un_safeCastObjectForKey:class:", CFSTR("subtitle"), objc_opt_class());
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_safeCastObjectForKey:class:", CFSTR("subtitle-loc-key"), objc_opt_class());
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)v13;
      if (v66 && Unique)
      {
        objc_msgSend(v12, "un_safeCastObjectForKey:class:", CFSTR("subtitle-loc-args"), objc_opt_class());
        v18 = (void *)v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[UNLocalizedStringFactory localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:](UNLocalizedStringFactory, "localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:", v66, v19, Unique, v18);
        v20 = objc_claimAutoreleasedReturnValue();

        v17 = v20;
      }
      -[UNMutableNotificationContent setSubtitle:](v6, "setSubtitle:", v17);
      objc_msgSend(v12, "un_safeCastObjectForKey:class:", CFSTR("title"), objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_safeCastObjectForKey:class:", CFSTR("title-loc-key"), objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)v17;
      if (v22 && cf)
      {
        objc_msgSend(v12, "un_safeCastObjectForKey:class:", CFSTR("title-loc-args"), objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[UNLocalizedStringFactory localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:](UNLocalizedStringFactory, "localizedUserNotificationStringForKey:arguments:cfBundle:defaultValue:", v22, v23, cf, v21);
        v24 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v24;
      }
      -[UNMutableNotificationContent setTitle:](v6, "setTitle:", v21);
      objc_msgSend(v12, "un_safeCastObjectForKey:class:", CFSTR("summary-arg"), objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNMutableNotificationContent setSummaryArgument:](v6, "setSummaryArgument:", v25);

      objc_msgSend(v12, "un_safeCastObjectForKey:class:", CFSTR("summary-arg-count"), objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNMutableNotificationContent setSummaryArgumentCount:](v6, "setSummaryArgumentCount:", objc_msgSend(v26, "unsignedIntegerValue"));

      objc_msgSend(v12, "un_safeCastObjectForKey:class:", CFSTR("launch-image"), objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNMutableNotificationContent setLaunchImageName:](v6, "setLaunchImageName:", v27);

      v3 = v64;
    }

  }
  objc_msgSend(v7, "un_safeCastObjectForKey:class:", CFSTR("badge"), objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNMutableNotificationContent setBadge:](v6, "setBadge:", v28);

  objc_msgSend(v7, "un_safeCastObjectForKey:class:", CFSTR("category"), objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNMutableNotificationContent setCategoryIdentifier:](v6, "setCategoryIdentifier:", v29);

  objc_msgSend(v7, "un_safeCastObjectForKey:class:", CFSTR("thread-id"), objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNMutableNotificationContent setThreadIdentifier:](v6, "setThreadIdentifier:", v30);

  objc_msgSend(v7, "un_safeCastObjectForKey:class:", CFSTR("target-content-id"), objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNMutableNotificationContent setTargetContentIdentifier:](v6, "setTargetContentIdentifier:", v31);

  objc_msgSend(v7, "objectForKey:", CFSTR("interruption-level"));
  v32 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v32;
  if (v32)
    v33 = -[UNPushNotificationRequestBuilder _interruptionLevelForString:](self, "_interruptionLevelForString:", v32);
  else
    v33 = 1;
  -[UNMutableNotificationContent setInterruptionLevel:](v6, "setInterruptionLevel:", v33);
  objc_msgSend(v7, "objectForKey:", CFSTR("relevance-score"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    objc_msgSend(v34, "doubleValue");
    -[UNMutableNotificationContent setRelevanceScore:](v6, "setRelevanceScore:");
  }
  v67 = v35;
  objc_msgSend(v7, "un_safeCastObjectForKey:class:", CFSTR("filter-criteria"), objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNMutableNotificationContent setFilterCriteria:](v6, "setFilterCriteria:", v36);

  objc_msgSend(v7, "objectForKey:", CFSTR("sound"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = objc_opt_class();
    UNSafeCast(v38, v37);
    v39 = objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v40 = (void *)v39;
      v41 = 0;
      v42 = 0;
    }
    else
    {
      v65 = v3;
      v43 = v37;
      objc_msgSend(v43, "un_safeCastObjectForKey:class:", CFSTR("name"), objc_opt_class());
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "un_safeCastObjectForKey:class:", CFSTR("critical"), objc_opt_class());
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v44, "BOOLValue");

      objc_msgSend(v43, "un_safeCastObjectForKey:class:", CFSTR("volume"), objc_opt_class());
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
      {
        v46 = v33 == 3;
        v3 = v65;
        goto LABEL_38;
      }
      v3 = v65;
    }
    v45 = objc_msgSend(v40, "isEqualToString:", CFSTR("default"));
    v46 = v33 == 3;
    if (!v45)
    {
      v47 = v42 ^ 1;
      if (v33 == 3)
        v47 = 0;
      if ((v47 & 1) != 0)
      {
        +[UNNotificationSound soundNamed:](UNNotificationSound, "soundNamed:", v40);
        v48 = objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      if (v41)
      {
        objc_msgSend(v41, "floatValue");
        +[UNNotificationSound criticalSoundNamed:withAudioVolume:](UNNotificationSound, "criticalSoundNamed:withAudioVolume:", v40);
        v48 = objc_claimAutoreleasedReturnValue();
LABEL_43:
        v49 = (void *)v48;
        -[UNMutableNotificationContent setSound:](v6, "setSound:", v48);

LABEL_44:
        goto LABEL_45;
      }
      +[UNNotificationSound criticalSoundNamed:](UNNotificationSound, "criticalSoundNamed:", v40);
      v61 = objc_claimAutoreleasedReturnValue();
LABEL_57:
      v41 = (void *)v61;
      -[UNMutableNotificationContent setSound:](v6, "setSound:", v61);
      goto LABEL_44;
    }
LABEL_38:
    if (!v46 && !v42)
    {
      +[UNNotificationSound defaultSound](UNNotificationSound, "defaultSound");
      v48 = objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    if (v41)
    {
      objc_msgSend(v41, "floatValue");
      +[UNNotificationSound defaultCriticalSoundWithAudioVolume:](UNNotificationSound, "defaultCriticalSoundWithAudioVolume:");
      v48 = objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    +[UNNotificationSound defaultCriticalSound](UNNotificationSound, "defaultCriticalSound");
    v61 = objc_claimAutoreleasedReturnValue();
    goto LABEL_57;
  }
LABEL_45:
  objc_msgSend(v7, "objectForKey:", CFSTR("topic-id"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = objc_opt_class();
    UNSafeCast(v51, v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v52)
    {
      v74[0] = v50;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UNPushNotificationRequestBuilder _sanitizeStringArray:](self, "_sanitizeStringArray:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNMutableNotificationContent setTopicIdentifiers:](v6, "setTopicIdentifiers:", v54);

    }
  }
  objc_msgSend(v7, "un_safeCastObjectForKey:class:", CFSTR("content-available"), objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "isEqual:", &unk_1E57FF290);

  objc_msgSend(v7, "un_safeCastObjectForKey:class:", CFSTR("mutable-content"), objc_opt_class());
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "isEqual:", &unk_1E57FF290);

  +[UNPushNotificationTrigger triggerWithContentAvailable:mutableContent:](UNPushNotificationTrigger, "triggerWithContentAvailable:mutableContent:", v56, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", self->_identifier, v6, v59);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (cf)
    CFRelease(cf);

LABEL_54:
  return v5;
}

- (id)buildSafePayload
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary un_safeCastObjectForKey:class:](self->_payload, "un_safeCastObjectForKey:class:", CFSTR("aps"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNPushNotificationRequestBuilder _sanitizeAPSDictionary:](self, "_sanitizeAPSDictionary:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "un_safeSetObject:forKey:", v4, CFSTR("aps"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSDictionary allKeys](self->_payload, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("aps")) & 1) == 0)
        {
          -[NSDictionary objectForKey:](self->_payload, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v11, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "un_nonEmptyCopy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_sanitizeAPSDictionary:(id)a3
{
  id v4;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("alert"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNPushNotificationRequestBuilder _sanitizeAlert:](self, "_sanitizeAlert:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_safeSetObject:forKey:");
  objc_msgSend(v4, "un_safeCastObjectForKey:class:", CFSTR("badge"), objc_opt_class());
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_safeSetObject:forKey:", v28 & ~(objc_msgSend((id)v28, "integerValue") >> 63), CFSTR("badge"));
  objc_msgSend(v4, "objectForKey:", CFSTR("sound"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNPushNotificationRequestBuilder _sanitizeSound:](self, "_sanitizeSound:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_safeSetObject:forKey:");
  objc_msgSend(v4, "objectForKey:", CFSTR("content-available"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNPushNotificationRequestBuilder _sanitizeFlag:](self, "_sanitizeFlag:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_safeSetObject:forKey:");
  objc_msgSend(v4, "objectForKey:", CFSTR("mutable-content"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNPushNotificationRequestBuilder _sanitizeFlag:](self, "_sanitizeFlag:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_safeSetObject:forKey:");
  objc_msgSend(v4, "un_safeCastObjectForKey:class:", CFSTR("category"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  if (objc_msgSend(v6, "length"))
    v7 = v6;
  else
    v7 = 0;
  objc_msgSend(v5, "un_safeSetObject:forKey:", v7, CFSTR("category"));
  objc_msgSend(v4, "un_safeCastObjectForKey:class:", CFSTR("thread-id"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v8;
  if (objc_msgSend(v8, "length"))
    v9 = v8;
  else
    v9 = 0;
  objc_msgSend(v5, "un_safeSetObject:forKey:", v9, CFSTR("thread-id"));
  objc_msgSend(v4, "un_safeCastObjectForKey:class:", CFSTR("target-content-id"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_safeSetObject:forKey:");
  objc_msgSend(v4, "objectForKey:", CFSTR("topic-id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNPushNotificationRequestBuilder _sanitizeTopicIdentifier:](self, "_sanitizeTopicIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_safeSetObject:forKey:", v11, CFSTR("topic-id"));
  objc_msgSend(v4, "un_safeCastObjectForKey:class:", CFSTR("interruption-level"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNPushNotificationRequestBuilder _sanitizeInterruptionLevelString:](self, "_sanitizeInterruptionLevelString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v5, "un_safeSetObject:forKey:", v13, CFSTR("interruption-level"));
  objc_msgSend(v4, "objectForKey:", CFSTR("relevance-score"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNPushNotificationRequestBuilder _sanitizeRelevanceScore:](self, "_sanitizeRelevanceScore:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_safeSetObject:forKey:", v15, CFSTR("relevance-score"));
  objc_msgSend(v4, "un_safeCastObjectForKey:class:", CFSTR("filter-criteria"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_safeSetObject:forKey:", v16, CFSTR("filter-criteria"));
  objc_msgSend(v5, "un_nonEmptyCopy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_sanitizeAlert:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
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
  UNPushNotificationRequestBuilder *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v4 = a3;
  v5 = objc_opt_class();
  UNSafeCast(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "length"))
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;
  }
  else
  {
    v10 = objc_opt_class();
    UNSafeCast(v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("body"), objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v13;
      if (objc_msgSend(v13, "length"))
        v14 = v13;
      else
        v14 = 0;
      objc_msgSend(v12, "un_safeSetObject:forKey:", v14, CFSTR("body"));
      objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("loc-key"), objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v15;
      if (!objc_msgSend(v15, "length"))
        v15 = 0;
      objc_msgSend(v12, "un_safeSetObject:forKey:", v15, CFSTR("loc-key"));
      if (v15)
      {
        objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("loc-args"), objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNPushNotificationRequestBuilder _sanitizeLocalizationArgumentsArray:](self, "_sanitizeLocalizationArgumentsArray:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "un_safeSetObject:forKey:", v17, CFSTR("loc-args"));

      }
      objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("action-loc-key"), objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v18;
      if (objc_msgSend(v18, "length"))
        v19 = v18;
      else
        v19 = 0;
      objc_msgSend(v12, "un_safeSetObject:forKey:", v19, CFSTR("action-loc-key"));
      objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("launch-image"), objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v20;
      if (objc_msgSend(v20, "length"))
        v21 = v20;
      else
        v21 = 0;
      objc_msgSend(v12, "un_safeSetObject:forKey:", v21, CFSTR("launch-image"));
      objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("subtitle"), objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v22;
      if (objc_msgSend(v22, "length"))
        v23 = v22;
      else
        v23 = 0;
      objc_msgSend(v12, "un_safeSetObject:forKey:", v23, CFSTR("subtitle"));
      objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("subtitle-loc-key"), objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v24;
      if (objc_msgSend(v24, "length"))
        v25 = v24;
      else
        v25 = 0;
      objc_msgSend(v12, "un_safeSetObject:forKey:", v25, CFSTR("subtitle-loc-key"));
      if (v25)
      {
        objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("subtitle-loc-args"), objc_opt_class());
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNPushNotificationRequestBuilder _sanitizeLocalizationArgumentsArray:](self, "_sanitizeLocalizationArgumentsArray:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "un_safeSetObject:forKey:", v27, CFSTR("subtitle-loc-args"));

      }
      objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("title"), objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v28;
      if (objc_msgSend(v28, "length"))
        v29 = v28;
      else
        v29 = 0;
      objc_msgSend(v12, "un_safeSetObject:forKey:", v29, CFSTR("title"));
      objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("title-loc-key"), objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = self;
      if (objc_msgSend(v30, "length"))
        v32 = v30;
      else
        v32 = 0;
      objc_msgSend(v12, "un_safeSetObject:forKey:", v32, CFSTR("title-loc-key"));
      if (v32)
      {
        objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("title-loc-args"), objc_opt_class());
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNPushNotificationRequestBuilder _sanitizeLocalizationArgumentsArray:](v31, "_sanitizeLocalizationArgumentsArray:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "un_safeSetObject:forKey:", v34, CFSTR("title-loc-args"));

      }
      objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("summary-arg"), objc_opt_class());
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "length"))
        v36 = v35;
      else
        v36 = 0;
      objc_msgSend(v12, "un_safeSetObject:forKey:", v36, CFSTR("summary-arg"));
      objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("summary-arg-count"), objc_opt_class());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNPushNotificationRequestBuilder _sanitizeUnsignedInteger:](v31, "_sanitizeUnsignedInteger:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_safeSetObject:forKey:", v38, CFSTR("summary-arg-count"));
      objc_msgSend(v12, "un_nonEmptyCopy");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)_sanitizeSound:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v4 = a3;
  v5 = objc_opt_class();
  UNSafeCast(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "length"))
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;
  }
  else
  {
    v10 = objc_opt_class();
    UNSafeCast(v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("critical"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNPushNotificationRequestBuilder _sanitizeFlag:](self, "_sanitizeFlag:", v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_safeSetObject:forKey:", v13, CFSTR("critical"));
      objc_msgSend(v11, "un_safeCastObjectForKey:class:", CFSTR("name"), objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
        v15 = v14;
      else
        v15 = 0;
      objc_msgSend(v12, "un_safeSetObject:forKey:", v15, CFSTR("name"));
      objc_msgSend(v11, "objectForKey:", CFSTR("volume"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNPushNotificationRequestBuilder _sanitizeVolume:](self, "_sanitizeVolume:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_safeSetObject:forKey:", v17, CFSTR("volume"));
      objc_msgSend(v12, "un_nonEmptyCopy");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)_sanitizeTopicIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = objc_opt_class();
  UNSafeCast(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "length"))
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;
  }
  else
  {
    v10 = objc_opt_class();
    UNSafeCast(v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[UNPushNotificationRequestBuilder _sanitizeStringArray:](self, "_sanitizeStringArray:", v11);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)_sanitizeStringArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "un_safeArrayContainingClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "un_filter:", &__block_literal_global_4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_nonEmptyCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __57__UNPushNotificationRequestBuilder__sanitizeStringArray___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

- (id)_sanitizeLocalizationArgumentsArray:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__UNPushNotificationRequestBuilder__sanitizeLocalizationArgumentsArray___block_invoke;
  v10[3] = &unk_1E57EFD30;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v4, "un_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

__CFString *__72__UNPushNotificationRequestBuilder__sanitizeLocalizationArgumentsArray___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  UNSafeCastAny(*(void **)(a1 + 32), a2);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E57F06A0;
  v4 = v2;

  return v4;
}

- (id)_sanitizeFlag:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;

  v3 = a3;
  v4 = objc_opt_class();
  UNSafeCast(v4, v3);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend((id)v5, "integerValue");
    v7 = (id)(v5 & ~(v6 >> 63));
    if (v6 < 0)
    {
      v9 = 0;
    }
    else
    {
      if (objc_msgSend((id)v5, "integerValue") <= 0)
      {
        v8 = (id)v5;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;
    }

  }
  else if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_sanitizeVolume:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = objc_opt_class();
  UNSafeCast(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    if (*(float *)&v6 >= 0.0)
    {
      objc_msgSend(v5, "floatValue");
      if (*(float *)&v6 <= 1.0)
      {
        v9 = v5;
        goto LABEL_9;
      }
      v7 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v6) = 1.0;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v6) = 0;
    }
    objc_msgSend(v7, "numberWithFloat:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v8 = v9;
    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)_sanitizeUnsignedInteger:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_opt_class();
  UNSafeCast(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "unsignedIntegerValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_sanitizeInterruptionLevelString:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = v3;
  if (v3
    && ((objc_msgSend(v3, "isEqualToString:", CFSTR("passive")) & 1) != 0
     || (objc_msgSend(v4, "isEqualToString:", CFSTR("active")) & 1) != 0
     || (objc_msgSend(v4, "isEqualToString:", CFSTR("time-sensitive")) & 1) != 0
     || objc_msgSend(v4, "isEqualToString:", CFSTR("critical"))))
  {
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)_interruptionLevelForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("passive")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("active")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("time-sensitive")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("critical")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)_sanitizeRelevanceScore:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  id v11;

  v3 = a3;
  v4 = objc_opt_class();
  UNSafeCast(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    if (v6 >= 0.0)
    {
      objc_msgSend(v5, "doubleValue");
      if (v10 <= 1.0)
      {
        v11 = v5;
        goto LABEL_9;
      }
      v7 = (void *)MEMORY[0x1E0CB37E8];
      v8 = 1.0;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      v8 = 0.0;
    }
    objc_msgSend(v7, "numberWithDouble:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v9 = v11;
    goto LABEL_10;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
