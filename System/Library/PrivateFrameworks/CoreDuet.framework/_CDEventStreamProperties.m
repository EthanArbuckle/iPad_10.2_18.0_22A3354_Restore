@implementation _CDEventStreamProperties

- (_DKObjectType)valueType
{
  return self->valueType;
}

- (NSString)name
{
  return self->name;
}

- (double)period
{
  return self->period;
}

- (BOOL)isHistorical
{
  return self->isHistorical;
}

- (int64_t)eventsPerPeriod
{
  return self->eventsPerPeriod;
}

- (int64_t)eventCountLimit
{
  return self->eventCountLimit;
}

- (double)temporalPrecision
{
  return self->temporalPrecision;
}

+ (id)eventStreamPropertiesFromDictionary:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "eventStreamPropertiesFromDictionary:defaultProperties:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)eventStreamPropertiesFromDictionary:(id)a3 defaultProperties:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_CDEventStreamProperties initFromDictionary:defaultProperties:]([_CDEventStreamProperties alloc], "initFromDictionary:defaultProperties:", v6, v5);

  return v7;
}

- (id)initFromDictionary:(id)a3 defaultProperties:(id)a4
{
  id v6;
  id v7;
  _CDEventStreamProperties *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *formattedName;
  uint64_t v13;
  NSString *knowledgeBaseName;
  uint64_t v15;
  NSString *descriptionString;
  uint64_t v17;
  NSObject *platformObject;
  uint64_t v19;
  NSObject *dataCollectionObject;
  uint64_t v21;
  NSString *monitorClass;
  void *v23;
  void *v24;
  id v25;
  NSString *v26;
  Class v27;
  uint64_t v28;
  _DKObjectType *valueType;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  char v45;
  void *v46;
  char v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v55;
  objc_super v56;

  v6 = a3;
  v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)_CDEventStreamProperties;
  v8 = -[_CDEventStreamProperties init](&v56, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPEventNameKey);
    v9 = objc_claimAutoreleasedReturnValue();
    name = v8->name;
    v8->name = (NSString *)v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPEventFormattedNameKey);
    v11 = objc_claimAutoreleasedReturnValue();
    formattedName = v8->formattedName;
    v8->formattedName = (NSString *)v11;

    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPKnowledgeBaseEventNameKey);
    v13 = objc_claimAutoreleasedReturnValue();
    knowledgeBaseName = v8->knowledgeBaseName;
    v8->knowledgeBaseName = (NSString *)v13;

    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPEventDescriptionKey);
    v15 = objc_claimAutoreleasedReturnValue();
    descriptionString = v8->descriptionString;
    v8->descriptionString = (NSString *)v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPPlatformsKey);
    v17 = objc_claimAutoreleasedReturnValue();
    platformObject = v8->_platformObject;
    v8->_platformObject = v17;

    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPDataCollectionKey);
    v19 = objc_claimAutoreleasedReturnValue();
    dataCollectionObject = v8->_dataCollectionObject;
    v8->_dataCollectionObject = v19;

    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPMonitorClassKey);
    v21 = objc_claimAutoreleasedReturnValue();
    monitorClass = v8->monitorClass;
    v8->monitorClass = (NSString *)v21;

    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPEventTypeKey);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
      objc_msgSend(CFSTR("_DK"), "stringByAppendingString:", v25);
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();
      v27 = NSClassFromString(v26);
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find matching class for '%@'. Check plist entry for '%@'."), v26, v25);
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
        v55 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v55);
      }
      -[objc_class performSelector:](v27, "performSelector:", sel_type);
      v28 = objc_claimAutoreleasedReturnValue();

      valueType = v8->valueType;
      v8->valueType = (_DKObjectType *)v28;
    }
    else
    {
      objc_msgSend(v7, "valueType");
      v30 = objc_claimAutoreleasedReturnValue();
      valueType = v8->valueType;
      v8->valueType = (_DKObjectType *)v30;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPSetupOnDemandKey);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
      v33 = objc_msgSend(v31, "BOOLValue");
    else
      v33 = objc_msgSend(v7, "setupOnDemand");
    v8->setupOnDemand = v33;
    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPTotalNumberOfEventsLimitKey);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      v35 = objc_msgSend(v34, "integerValue");
    else
      v35 = objc_msgSend(v7, "eventCountLimit");
    v8->eventCountLimit = v35;
    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPEphemeralityInSecondsKey);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
      objc_msgSend(v36, "doubleValue");
    else
      objc_msgSend(v7, "timeToLive");
    v8->timeToLive = v37;
    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPTimestampPrecisionInSecondsKey);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
      objc_msgSend(v38, "doubleValue");
    else
      objc_msgSend(v7, "temporalPrecision");
    v8->temporalPrecision = v39;
    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPRateLimitPeriodInSecondsKey);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
      objc_msgSend(v40, "doubleValue");
    else
      objc_msgSend(v7, "period");
    v8->period = v41;
    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPRateLimitCountKey);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
      objc_msgSend(v42, "doubleValue");
    else
      v43 = (double)objc_msgSend(v7, "eventsPerPeriod");
    v8->eventsPerPeriod = (uint64_t)v43;
    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPIsInstant);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
      v45 = objc_msgSend(v44, "BOOLValue");
    else
      v45 = objc_msgSend(v7, "isInstant");
    v8->isInstant = v45;
    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPIsHistorical);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
      v47 = objc_msgSend(v46, "BOOLValue");
    else
      v47 = objc_msgSend(v7, "isHistorical");
    v8->isHistorical = v47;
    objc_msgSend(v6, "objectForKey:", kCDESPShouldSaveCurrentEventOnShutdown);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
      v49 = objc_msgSend(v48, "BOOLValue");
    else
      v49 = objc_msgSend(v7, "shouldSaveCurrentEventOnShutdown");
    v8->shouldSaveCurrentEventOnShutdown = v49;
    objc_msgSend(v6, "objectForKeyedSubscript:", kCDESPPollingPeriod);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v50)
    {
      v52 = v50;
      if ((objc_msgSend(v52, "isEqualToString:", CFSTR("Min")) & 1) != 0)
      {
        v53 = 1;
      }
      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("4Hour")) & 1) != 0)
      {
        v53 = 2;
      }
      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("6Hour")) & 1) != 0)
      {
        v53 = 3;
      }
      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("12Hour")) & 1) != 0)
      {
        v53 = 4;
      }
      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("18Hour")) & 1) != 0)
      {
        v53 = 5;
      }
      else if (objc_msgSend(v52, "isEqualToString:", CFSTR("24Hour")))
      {
        v53 = 6;
      }
      else
      {
        v53 = 7;
      }

    }
    else
    {
      v53 = objc_msgSend(v7, "pollingPeriod");
    }
    v8->pollingPeriod = v53;

  }
  return v8;
}

- (BOOL)shouldSaveCurrentEventOnShutdown
{
  return self->shouldSaveCurrentEventOnShutdown;
}

- (BOOL)setupOnDemand
{
  return self->setupOnDemand;
}

- (int64_t)pollingPeriod
{
  return self->pollingPeriod;
}

- (BOOL)isInstant
{
  return self->isInstant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAvailabilityNum, 0);
  objc_storeStrong((id *)&self->_isAvailableNum, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong((id *)&self->_dataCollectionEnabledNum, 0);
  objc_storeStrong((id *)&self->_dataCollectionObject, 0);
  objc_storeStrong((id *)&self->valueType, 0);
  objc_storeStrong((id *)&self->monitorClass, 0);
  objc_storeStrong((id *)&self->descriptionString, 0);
  objc_storeStrong((id *)&self->knowledgeBaseMetadataClass, 0);
  objc_storeStrong((id *)&self->knowledgeBaseName, 0);
  objc_storeStrong((id *)&self->formattedName, 0);
  objc_storeStrong((id *)&self->name, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  int64_t v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v29 = (void *)MEMORY[0x1E0CB3940];
  -[_CDEventStreamProperties formattedName](self, "formattedName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDEventStreamProperties name](self, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDEventStreamProperties knowledgeBaseName](self, "knowledgeBaseName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDEventStreamProperties descriptionString](self, "descriptionString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_CDEventStreamProperties isAvailable](self, "isAvailable"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _CDDomainAvailabilityDescription(-[_CDEventStreamProperties domainAvailability](self, "domainAvailability"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_CDEventStreamProperties dataCollectionEnabled](self, "dataCollectionEnabled"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDEventStreamProperties monitorClass](self, "monitorClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDEventStreamProperties valueType](self, "valueType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_CDEventStreamProperties setupOnDemand](self, "setupOnDemand");
  v6 = -[_CDEventStreamProperties eventCountLimit](self, "eventCountLimit");
  -[_CDEventStreamProperties timeToLive](self, "timeToLive");
  v8 = v7;
  -[_CDEventStreamProperties temporalPrecision](self, "temporalPrecision");
  v10 = v9;
  v11 = -[_CDEventStreamProperties eventsPerPeriod](self, "eventsPerPeriod");
  -[_CDEventStreamProperties period](self, "period");
  v13 = v12;
  v14 = -[_CDEventStreamProperties isInstant](self, "isInstant");
  v15 = -[_CDEventStreamProperties isHistorical](self, "isHistorical");
  v16 = -[_CDEventStreamProperties shouldSaveCurrentEventOnShutdown](self, "shouldSaveCurrentEventOnShutdown");
  v17 = -[_CDEventStreamProperties pollingPeriod](self, "pollingPeriod");
  if ((unint64_t)(v17 - 1) > 5)
    v18 = CFSTR("Max");
  else
    v18 = off_1E26E4158[v17 - 1];
  v19 = MEMORY[0x1E0C9AAA0];
  if (v16)
    v20 = MEMORY[0x1E0C9AAB0];
  else
    v20 = MEMORY[0x1E0C9AAA0];
  if (v15)
    v21 = MEMORY[0x1E0C9AAB0];
  else
    v21 = MEMORY[0x1E0C9AAA0];
  if (v14)
    v22 = MEMORY[0x1E0C9AAB0];
  else
    v22 = MEMORY[0x1E0C9AAA0];
  if (v5)
    v19 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v29, "stringWithFormat:", CFSTR("Event Stream Formatted Name: %@ ; \n\tEvent Stream Name: %@ ; \n\tKnowledgeBase Event Stream Name: %@ ; \n\tEvent Stream Description: %@ ; \n\tisAvailable: %@ ; domains: %@\n\tData Collection Enabled: %@ ;\n\tMonitorClass: %@ ; \n\tValue Type: %@ ; SetupOnDemand: %@ ; \n\tEvent Count Limit: %ld ; Life Time seconds: %f ; \n\tTemporal Precision: %f ; \n\tRate Limiting: (%ld) events in (%f) seconds ; \n\tInstant: %@ ; Historical: %@ ; Persist at shutdown: %@ ; Polling Period: %@ ; \n"),
    v33,
    v32,
    v31,
    v30,
    v28,
    v27,
    v26,
    v3,
    v4,
    v19,
    v6,
    v8,
    v10,
    v11,
    v13,
    v22,
    v21,
    v20,
    v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (BOOL)isAvailable
{
  NSNumber *isAvailableNum;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSNumber *v17;
  NSNumber *v18;
  NSObject *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  isAvailableNum = self->_isAvailableNum;
  if (!isAvailableNum)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = self->_platformObject;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[NSObject copy](v5, "copy");
      v27[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = v7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(CFSTR("iOS"), "caseInsensitiveCompare:", CFSTR("tvOS"));
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v8 = v5;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
      {
        v10 = v9;
        v20 = v5;
        v21 = v4;
        v11 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("."), v20, v21, (_QWORD)v22);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "firstObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("iOS"));

            if (!v15)
            {
              v16 = 1;
              goto LABEL_16;
            }
          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v10)
            continue;
          break;
        }
        v16 = 0;
LABEL_16:
        v5 = v20;
        v4 = v21;
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(v4, "numberWithBool:", v16);
    v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v18 = self->_isAvailableNum;
    self->_isAvailableNum = v17;

    isAvailableNum = self->_isAvailableNum;
  }
  return -[NSNumber BOOLValue](isAvailableNum, "BOOLValue");
}

- (unint64_t)domainAvailability
{
  _CDEventStreamProperties *v2;
  NSNumber *domainAvailabilityNum;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSNumber *v19;
  NSObject *v21;
  _CDEventStreamProperties *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v2 = self;
  v28[1] = *MEMORY[0x1E0C80C00];
  domainAvailabilityNum = self->_domainAvailabilityNum;
  if (!domainAvailabilityNum)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = v2->_platformObject;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[NSObject copy](v5, "copy");
      v28[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = v7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v2;
      v21 = v5;
      v8 = v5;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v12 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("."));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "firstObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15 && !objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("iOS")))
            {
              if (objc_msgSend(v14, "count") == 1)
              {
                v11 = 3;
              }
              else if (objc_msgSend(v14, "count") == 2)
              {
                objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v17, "caseInsensitiveCompare:", CFSTR("system")))
                {
                  if (!objc_msgSend(v17, "caseInsensitiveCompare:", CFSTR("user")))
                    v11 |= 2uLL;
                }
                else
                {
                  v11 |= 1uLL;
                }

              }
            }

          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v10);
      }
      else
      {
        v11 = 0;
      }

      v2 = v22;
      v5 = v21;
    }
    else
    {
      v11 = 0;
    }

    objc_msgSend(v4, "numberWithUnsignedLong:", v11);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v2->_domainAvailabilityNum;
    v2->_domainAvailabilityNum = (NSNumber *)v18;

    domainAvailabilityNum = v2->_domainAvailabilityNum;
  }
  return -[NSNumber unsignedLongValue](domainAvailabilityNum, "unsignedLongValue");
}

- (BOOL)dataCollectionEnabled
{
  NSNumber *dataCollectionEnabledNum;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSNumber *v11;
  NSNumber *v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[1] = *MEMORY[0x1E0C80C00];
  dataCollectionEnabledNum = self->_dataCollectionEnabledNum;
  if (!dataCollectionEnabledNum)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = self->_dataCollectionObject;
    if (+[_CDDeviceInfo isRunningOnInternalBuild](_CDDeviceInfo, "isRunningOnInternalBuild"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = -[NSObject BOOLValue](v5, "BOOLValue");
LABEL_12:

        objc_msgSend(v4, "numberWithBool:", v6);
        v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v12 = self->_dataCollectionEnabledNum;
        self->_dataCollectionEnabledNum = v11;

        dataCollectionEnabledNum = self->_dataCollectionEnabledNum;
        return -[NSNumber BOOLValue](dataCollectionEnabledNum, "BOOLValue");
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v5;
        -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("Enabled"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "BOOLValue"))
        {
          -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("DisabledCountries"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = v9;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v14 = 0;
              goto LABEL_31;
            }
            v25[0] = v9;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
            v10 = (id)objc_claimAutoreleasedReturnValue();
          }
          v14 = v10;
          if (v10 && objc_msgSend(v10, "count"))
          {
            if (dataCollectionIsEnabled_onceToken != -1)
              dispatch_once(&dataCollectionIsEnabled_onceToken, &__block_literal_global_16);
            if (dataCollectionIsEnabled_countryCode)
            {
              v22 = 0u;
              v23 = 0u;
              v20 = 0u;
              v21 = 0u;
              v14 = v14;
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
              if (v15)
              {
                v16 = v15;
                v19 = v9;
                v17 = *(_QWORD *)v21;
                while (2)
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(_QWORD *)v21 != v17)
                      objc_enumerationMutation(v14);
                    if (!objc_msgSend((id)dataCollectionIsEnabled_countryCode, "caseInsensitiveCompare:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i)))
                    {
                      v6 = 0;
                      goto LABEL_33;
                    }
                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
                  if (v16)
                    continue;
                  break;
                }
                v6 = 1;
LABEL_33:
                v9 = v19;
              }
              else
              {
                v6 = 1;
              }

            }
            else
            {
              v6 = 0;
            }
            goto LABEL_37;
          }
LABEL_31:
          v6 = 1;
LABEL_37:

          goto LABEL_12;
        }

      }
    }
    v6 = 0;
    goto LABEL_12;
  }
  return -[NSNumber BOOLValue](dataCollectionEnabledNum, "BOOLValue");
}

- (NSString)formattedName
{
  return self->formattedName;
}

- (NSString)knowledgeBaseName
{
  return self->knowledgeBaseName;
}

- (NSString)knowledgeBaseMetadataClass
{
  return self->knowledgeBaseMetadataClass;
}

- (NSString)descriptionString
{
  return self->descriptionString;
}

- (NSString)monitorClass
{
  return self->monitorClass;
}

- (double)timeToLive
{
  return self->timeToLive;
}

- (NSObject)dataCollectionObject
{
  return self->_dataCollectionObject;
}

- (NSNumber)dataCollectionEnabledNum
{
  return self->_dataCollectionEnabledNum;
}

- (NSObject)platformObject
{
  return self->_platformObject;
}

- (NSNumber)isAvailableNum
{
  return self->_isAvailableNum;
}

- (NSNumber)domainAvailabilityNum
{
  return self->_domainAvailabilityNum;
}

@end
