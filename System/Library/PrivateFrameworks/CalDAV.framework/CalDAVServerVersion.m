@implementation CalDAVServerVersion

+ (id)_prototypeMatchingServerHeaders:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CalDAVConcreteServerVersion prototypes](CalDAVConcreteServerVersion, "prototypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
        objc_msgSend(v11, "regularExpression", (_QWORD)v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v12, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count"))
          {
            v14 = (void *)objc_msgSend(v11, "copy");
            objc_msgSend(v13, "objectAtIndex:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v15, "numberOfRanges") >= 2)
            {
              v16 = objc_msgSend(v15, "rangeAtIndex:", 1);
              if (v16 != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v3, "substringWithRange:", v16, v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "doubleValue");
                v20 = v19;

                objc_msgSend(v14, "setVersion:", v20);
              }
            }

            if (v14)
              goto LABEL_18;
            goto LABEL_17;
          }

        }
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

  }
LABEL_17:
  v14 = (void *)objc_msgSend((id)_unknownServerVersionPrototype, "copy", (_QWORD)v22);
LABEL_18:
  objc_msgSend(v14, "setServerHeader:", v3);

  return v14;
}

- (id)_propertiesToComplianceClasses
{
  if (_propertiesToComplianceClasses_configuredProperties != -1)
    dispatch_once(&_propertiesToComplianceClasses_configuredProperties, &__block_literal_global_48);
  return (id)_calDAVPropertyToComplianceClassMapping;
}

void __53__CalDAVServerVersion__propertiesToComplianceClasses__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("calendar-auto-schedule"), CFSTR("supportsAutoSchedule"), CFSTR("calendarserver-private-comments"), CFSTR("supportsPrivateComments"), CFSTR("calendarserver-clearing-private-comments"), CFSTR("supportsClearingPrivateComments"), CFSTR("calendarserver-recurrence-split"), CFSTR("supportsLikenessPropagation"), CFSTR("calendarserver-sharing"), CFSTR("supportsSharing"), CFSTR("calendarserver-sharing-no-scheduling"), CFSTR("supportsSharingNoScheduling"), CFSTR("calendar-proxy"), CFSTR("supportsCalendarProxy"), CFSTR("inbox-availability"), CFSTR("supportsInboxAvailability"), CFSTR("calendarserver-private-events"),
         CFSTR("supportsPrivateEvents"),
         CFSTR("calendarserver-subscribed"),
         CFSTR("supportsSubscriptionCalendars"),
         CFSTR("calendarserver-managed-subscribed"),
         CFSTR("supportsManagedSubscriptionCalendars"),
         CFSTR("calendarserver-subscribed-mirror"),
         CFSTR("supportsSubscriptionMirroring"),
         CFSTR("calendar-role"),
         CFSTR("supportsParticipantRoles"),
         CFSTR("calendarserver-principal-property-search"),
         CFSTR("supportsPrincipalPropertySearch"),
         CFSTR("calendar-query-extended"),
         CFSTR("supportsExtendedCalendarQuery"),
         CFSTR("calendar-managed-attachments"),
         CFSTR("supportsManagedAttachments"),
         CFSTR("calendarserver-home-sync"),
         CFSTR("supportsCalendarHomeSync"),
         CFSTR("calendar-no-timezone"),
         CFSTR("supportsCalendarNoTimezone"),
         CFSTR("calendarserver-recurrence-split"),
         CFSTR("supportsCalendarRecurrenceSplit"),
         CFSTR("calendar-audit"),
         CFSTR("supportsCalendarAudit"),
         CFSTR("caldavserver-supports-telephone"),
         CFSTR("supportsTelephone"),
         CFSTR("calendar-default-alarms"),
         CFSTR("supportsDefaultAlarms"),
         0);
  v1 = (void *)_calDAVPropertyToComplianceClassMapping;
  _calDAVPropertyToComplianceClassMapping = v0;

}

- (id)_additionalFlagKeys
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("supportsTimeRangeFilter"), CFSTR("supportsTimeRangeFilterWithoutEndDate"), CFSTR("supportsTimeRangeFilterOnInbox"), CFSTR("supportsRequestCompression"), CFSTR("supportsCheckForValidEmail"), CFSTR("supportsChecksumming"), CFSTR("alwaysSupportsFreebusyOnOutbox"), 0);
}

- (id)_allFlagKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__CalDAVServerVersion__allFlagKeys__block_invoke;
  block[3] = &unk_24C1FB270;
  block[4] = self;
  if (_allFlagKeys_configuredFlags != -1)
    dispatch_once(&_allFlagKeys_configuredFlags, block);
  return (id)_calDAVAllFlagProperties;
}

void __35__CalDAVServerVersion__allFlagKeys__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_propertiesToComplianceClasses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_additionalFlagKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_calDAVAllFlagProperties;
  _calDAVAllFlagProperties = v4;

}

- (void)_setPropertiesFromComplianceClasses:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CalDAVServerVersion *v9;

  v4 = a3;
  -[CalDAVServerVersion setComplianceClasses:](self, "setComplianceClasses:", v4);
  -[CalDAVServerVersion _propertiesToComplianceClasses](self, "_propertiesToComplianceClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__CalDAVServerVersion__setPropertiesFromComplianceClasses___block_invoke;
  v7[3] = &unk_24C1FB6F0;
  v6 = v4;
  v8 = v6;
  v9 = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

  if (!-[CalDAVServerVersion supportsInboxAvailability](self, "supportsInboxAvailability"))
    -[CalDAVServerVersion setSupportsInboxAvailability:](self, "setSupportsInboxAvailability:", objc_msgSend(v6, "containsObject:", CFSTR("calendar-availability")));

}

void __59__CalDAVServerVersion__setPropertiesFromComplianceClasses___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "containsObject:", a3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v8, v6);

}

+ (CalDAVServerVersion)versionWithHTTPHeaders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE1AAA8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CDVCleanedStringsFromResponseHeaders();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_prototypeMatchingServerHeaders:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setPropertiesFromComplianceClasses:", v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  CDVCleanedStringsFromResponseHeaders();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "isEqualToString:", CFSTR("gzip"), (_QWORD)v14))
        {
          objc_msgSend(v7, "setSupportsRequestCompression:", 1);
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return (CalDAVServerVersion *)v7;
}

- (CalDAVServerVersion)init
{
  CalDAVServerVersion *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CalDAVServerVersion;
  result = -[CalDAVServerVersion init](&v3, sel_init);
  if (result)
  {
    result->_version = 0.0;
    *(_WORD *)&result->_supportsTimeRangeFilter = 257;
    result->_supportsTimeRangeFilterOnInbox = 1;
    result->_supportsRequestCompression = 0;
    result->_supportsChecksumming = 1;
    result->_alwaysSupportsFreebusyOnOutbox = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init((Class)objc_opt_class());
  -[CalDAVServerVersion version](self, "version");
  objc_msgSend(v4, "setVersion:");
  -[CalDAVServerVersion serverHeader](self, "serverHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServerHeader:", v5);

  -[CalDAVServerVersion supportedCalendarComponentSets](self, "supportedCalendarComponentSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportedCalendarComponentSets:", v6);

  -[CalDAVServerVersion complianceClasses](self, "complianceClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setComplianceClasses:", v7);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CalDAVServerVersion _allFlagKeys](self, "_allFlagKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[CalDAVServerVersion valueForKey:](self, "valueForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setValue:forKey:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double v5;
  unint64_t v6;

  -[CalDAVServerVersion type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CalDAVServerVersion version](self, "version");
  v6 = v4 + (unint64_t)v5 + -[CalDAVServerVersion supportsAutoSchedule](self, "supportsAutoSchedule");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVServerVersion type](self, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      objc_msgSend(v5, "version");
      v9 = v8;
      -[CalDAVServerVersion version](self, "version");
      v11 = v10;

      if (v9 == v11)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        -[CalDAVServerVersion _allFlagKeys](self, "_allFlagKeys", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v24;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(v5, "valueForKey:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[CalDAVServerVersion valueForKey:](self, "valueForKey:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v18, "isEqualToNumber:", v19);

              if (!v20)
              {
                v21 = 0;
                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (v14)
              continue;
            break;
          }
        }
        v21 = 1;
LABEL_19:

        goto LABEL_16;
      }
    }
    else
    {

    }
    v21 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v21 = 0;
LABEL_17:

  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CalDAVServerVersion complianceClasses](self, "complianceClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  if ((unint64_t)objc_msgSend(v3, "length") >= 3)
    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 2, 2);
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[CalDAVServerVersion type](self, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVServerVersion version](self, "version");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@/%0.1f (%@)"), v10, v11, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)type
{
  return (NSString *)CFSTR("Unknown");
}

+ (CalDAVServerVersion)versionWithPropertyValue:(id)a3
{
  id v3;
  double v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = 0.0;
  if (!v3)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v12 = 0;
    v5 = CFSTR("Unknown");
    goto LABEL_26;
  }
  objc_opt_class();
  v5 = CFSTR("Unknown");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v12 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("CalDAVServerType"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (__CFString *)v6;
  else
    v8 = CFSTR("Unknown");
  v5 = v8;

  objc_msgSend(v3, "objectForKey:", CFSTR("CalDAVServerVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      v4 = v10;
    }
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("SupportsCompression"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v32 = objc_msgSend(v11, "BOOLValue");
  else
    v32 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("ComplianceClasses"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ServerHeader"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SupportedCalendarComponentSets"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("CalDAVAutoSchedule"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13
    || (objc_msgSend(v3, "objectForKey:", CFSTR("CalDAVSupportsComments")),
        (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_18:
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("CalDAVAutoSchedule"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v14, "addObject:", CFSTR("calendar-auto-schedule"));
    objc_msgSend(v3, "objectForKey:", CFSTR("CalDAVSupportsComments"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(v14, "addObject:", CFSTR("calendarserver-private-comments"));
    objc_msgSend(v3, "objectForKey:", CFSTR("CalDAVSupportsSharing"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(v14, "addObject:", CFSTR("calendarserver-sharing"));
    objc_msgSend(v14, "setByAddingObjectsFromSet:", v12);
    v18 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v18;
    goto LABEL_25;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("CalDAVSupportsSharing"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    goto LABEL_18;
LABEL_25:

LABEL_26:
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  +[CalDAVConcreteServerVersion prototypes](CalDAVConcreteServerVersion, "prototypes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
LABEL_28:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v23);
      objc_msgSend(v24, "type");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[__CFString isEqualToString:](v5, "isEqualToString:", v25);

      if ((v26 & 1) != 0)
        break;
      if (v21 == ++v23)
      {
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v21)
          goto LABEL_28;
        goto LABEL_34;
      }
    }
    v27 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v27, "setVersion:", v4);

    if (v27)
      goto LABEL_37;
  }
  else
  {
LABEL_34:

  }
  v27 = (void *)objc_msgSend((id)_unknownServerVersionPrototype, "copy");
LABEL_37:
  objc_msgSend(v27, "_setPropertiesFromComplianceClasses:", v12);
  objc_msgSend(v27, "setServerHeader:", v31);
  objc_msgSend(v27, "setSupportsRequestCompression:", v32);
  objc_msgSend(v27, "setSupportedCalendarComponentSets:", v30);

  return (CalDAVServerVersion *)v27;
}

- (id)propertyValue
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, void *);
  void *v20;
  CalDAVServerVersion *v21;
  id v22;

  -[CalDAVServerVersion complianceClasses](self, "complianceClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVServerVersion _propertiesToComplianceClasses](self, "_propertiesToComplianceClasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __36__CalDAVServerVersion_propertyValue__block_invoke;
    v20 = &unk_24C1FB6F0;
    v21 = self;
    v6 = v4;
    v22 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v17);

    v7 = v6;
    v3 = v7;
  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[CalDAVServerVersion version](self, "version");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("CalDAVServerVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CalDAVServerVersion supportsRequestCompression](self, "supportsRequestCompression"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("SupportsCompression"));

  objc_msgSend(v3, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("ComplianceClasses"));

  -[CalDAVServerVersion type](self, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("CalDAVServerType"));
  -[CalDAVServerVersion serverHeader](self, "serverHeader", v17, v18, v19, v20, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("ServerHeader"));
  -[CalDAVServerVersion supportedCalendarComponentSets](self, "supportedCalendarComponentSets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v8, "setObject:forKey:", v15, CFSTR("SupportedCalendarComponentSets"));

  return v8;
}

void __36__CalDAVServerVersion_propertyValue__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

- (BOOL)requiresOpeningAttachmentAsLink
{
  return 0;
}

- (BOOL)shouldUseDeleteAndAddInsteadOfMoveBetweenCalendars
{
  return 0;
}

- (double)version
{
  return self->_version;
}

- (void)setVersion:(double)a3
{
  self->_version = a3;
}

- (BOOL)supportsTimeRangeFilter
{
  return self->_supportsTimeRangeFilter;
}

- (void)setSupportsTimeRangeFilter:(BOOL)a3
{
  self->_supportsTimeRangeFilter = a3;
}

- (BOOL)supportsTimeRangeFilterWithoutEndDate
{
  return self->_supportsTimeRangeFilterWithoutEndDate;
}

- (void)setSupportsTimeRangeFilterWithoutEndDate:(BOOL)a3
{
  self->_supportsTimeRangeFilterWithoutEndDate = a3;
}

- (BOOL)supportsTimeRangeFilterOnInbox
{
  return self->_supportsTimeRangeFilterOnInbox;
}

- (void)setSupportsTimeRangeFilterOnInbox:(BOOL)a3
{
  self->_supportsTimeRangeFilterOnInbox = a3;
}

- (BOOL)supportsAutoSchedule
{
  return self->_supportsAutoSchedule;
}

- (void)setSupportsAutoSchedule:(BOOL)a3
{
  self->_supportsAutoSchedule = a3;
}

- (BOOL)supportsPrivateComments
{
  return self->_supportsPrivateComments;
}

- (void)setSupportsPrivateComments:(BOOL)a3
{
  self->_supportsPrivateComments = a3;
}

- (BOOL)supportsClearingPrivateComments
{
  return self->_supportsClearingPrivateComments;
}

- (void)setSupportsClearingPrivateComments:(BOOL)a3
{
  self->_supportsClearingPrivateComments = a3;
}

- (BOOL)supportsLikenessPropagation
{
  return self->_supportsLikenessPropagation;
}

- (void)setSupportsLikenessPropagation:(BOOL)a3
{
  self->_supportsLikenessPropagation = a3;
}

- (BOOL)supportsSharing
{
  return self->_supportsSharing;
}

- (void)setSupportsSharing:(BOOL)a3
{
  self->_supportsSharing = a3;
}

- (BOOL)supportsSharingNoScheduling
{
  return self->_supportsSharingNoScheduling;
}

- (void)setSupportsSharingNoScheduling:(BOOL)a3
{
  self->_supportsSharingNoScheduling = a3;
}

- (BOOL)supportsCalendarProxy
{
  return self->_supportsCalendarProxy;
}

- (void)setSupportsCalendarProxy:(BOOL)a3
{
  self->_supportsCalendarProxy = a3;
}

- (BOOL)supportsInboxAvailability
{
  return self->_supportsInboxAvailability;
}

- (void)setSupportsInboxAvailability:(BOOL)a3
{
  self->_supportsInboxAvailability = a3;
}

- (BOOL)supportsPrivateEvents
{
  return self->_supportsPrivateEvents;
}

- (void)setSupportsPrivateEvents:(BOOL)a3
{
  self->_supportsPrivateEvents = a3;
}

- (BOOL)supportsSubscriptionCalendars
{
  return self->_supportsSubscriptionCalendars;
}

- (void)setSupportsSubscriptionCalendars:(BOOL)a3
{
  self->_supportsSubscriptionCalendars = a3;
}

- (BOOL)supportsManagedSubscriptionCalendars
{
  return self->_supportsManagedSubscriptionCalendars;
}

- (void)setSupportsManagedSubscriptionCalendars:(BOOL)a3
{
  self->_supportsManagedSubscriptionCalendars = a3;
}

- (BOOL)supportsSubscriptionMirroring
{
  return self->_supportsSubscriptionMirroring;
}

- (void)setSupportsSubscriptionMirroring:(BOOL)a3
{
  self->_supportsSubscriptionMirroring = a3;
}

- (BOOL)supportsParticipantRoles
{
  return self->_supportsParticipantRoles;
}

- (void)setSupportsParticipantRoles:(BOOL)a3
{
  self->_supportsParticipantRoles = a3;
}

- (BOOL)supportsPrincipalPropertySearch
{
  return self->_supportsPrincipalPropertySearch;
}

- (void)setSupportsPrincipalPropertySearch:(BOOL)a3
{
  self->_supportsPrincipalPropertySearch = a3;
}

- (BOOL)supportsExtendedCalendarQuery
{
  return self->_supportsExtendedCalendarQuery;
}

- (void)setSupportsExtendedCalendarQuery:(BOOL)a3
{
  self->_supportsExtendedCalendarQuery = a3;
}

- (BOOL)supportsRequestCompression
{
  return self->_supportsRequestCompression;
}

- (void)setSupportsRequestCompression:(BOOL)a3
{
  self->_supportsRequestCompression = a3;
}

- (BOOL)supportsManagedAttachments
{
  return self->_supportsManagedAttachments;
}

- (void)setSupportsManagedAttachments:(BOOL)a3
{
  self->_supportsManagedAttachments = a3;
}

- (BOOL)supportsCheckForValidEmail
{
  return self->_supportsCheckForValidEmail;
}

- (void)setSupportsCheckForValidEmail:(BOOL)a3
{
  self->_supportsCheckForValidEmail = a3;
}

- (BOOL)supportsChecksumming
{
  return self->_supportsChecksumming;
}

- (void)setSupportsChecksumming:(BOOL)a3
{
  self->_supportsChecksumming = a3;
}

- (BOOL)supportsCalendarHomeSync
{
  return self->_supportsCalendarHomeSync;
}

- (void)setSupportsCalendarHomeSync:(BOOL)a3
{
  self->_supportsCalendarHomeSync = a3;
}

- (NSString)supportedCalendarComponentSets
{
  return self->_supportedCalendarComponentSets;
}

- (void)setSupportedCalendarComponentSets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)supportsCalendarNoTimezone
{
  return self->_supportsCalendarNoTimezone;
}

- (void)setSupportsCalendarNoTimezone:(BOOL)a3
{
  self->_supportsCalendarNoTimezone = a3;
}

- (BOOL)supportsCalendarRecurrenceSplit
{
  return self->_supportsCalendarRecurrenceSplit;
}

- (void)setSupportsCalendarRecurrenceSplit:(BOOL)a3
{
  self->_supportsCalendarRecurrenceSplit = a3;
}

- (BOOL)alwaysSupportsFreebusyOnOutbox
{
  return self->_alwaysSupportsFreebusyOnOutbox;
}

- (void)setAlwaysSupportsFreebusyOnOutbox:(BOOL)a3
{
  self->_alwaysSupportsFreebusyOnOutbox = a3;
}

- (BOOL)supportsCalendarAudit
{
  return self->_supportsCalendarAudit;
}

- (void)setSupportsCalendarAudit:(BOOL)a3
{
  self->_supportsCalendarAudit = a3;
}

- (BOOL)supportsTelephone
{
  return self->_supportsTelephone;
}

- (void)setSupportsTelephone:(BOOL)a3
{
  self->_supportsTelephone = a3;
}

- (BOOL)supportsDefaultAlarms
{
  return self->_supportsDefaultAlarms;
}

- (void)setSupportsDefaultAlarms:(BOOL)a3
{
  self->_supportsDefaultAlarms = a3;
}

- (BOOL)expandPropertyReportIsUnreliable
{
  return self->_expandPropertyReportIsUnreliable;
}

- (void)setExpandPropertyReportIsUnreliable:(BOOL)a3
{
  self->_expandPropertyReportIsUnreliable = a3;
}

- (NSSet)complianceClasses
{
  return self->_complianceClasses;
}

- (void)setComplianceClasses:(id)a3
{
  objc_storeStrong((id *)&self->_complianceClasses, a3);
}

- (NSString)serverHeader
{
  return self->_serverHeader;
}

- (void)setServerHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHeader, 0);
  objc_storeStrong((id *)&self->_complianceClasses, 0);
  objc_storeStrong((id *)&self->_supportedCalendarComponentSets, 0);
}

@end
