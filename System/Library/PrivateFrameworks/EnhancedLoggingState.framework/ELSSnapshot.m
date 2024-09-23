@implementation ELSSnapshot

- (ELSSnapshot)init
{
  ELSSnapshot *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSUserDefaults *defaults;
  void *v8;
  objc_super v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  Class (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (init_onceToken != -1)
    dispatch_once(&init_onceToken, &__block_literal_global_2);
  v10.receiver = self;
  v10.super_class = (Class)ELSSnapshot;
  v3 = -[ELSSnapshot init](&v10, sel_init);
  if (v3)
  {
    if (!CheckerBoardServicesLibraryCore_frameworkLibrary)
    {
      v15 = xmmword_24D173B98;
      v16 = 0;
      CheckerBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (CheckerBoardServicesLibraryCore_frameworkLibrary)
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2050000000;
      v4 = (void *)getCBSUtilitiesClass_softClass;
      v14 = getCBSUtilitiesClass_softClass;
      if (!getCBSUtilitiesClass_softClass)
      {
        *(_QWORD *)&v15 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v15 + 1) = 3221225472;
        v16 = __getCBSUtilitiesClass_block_invoke;
        v17 = &unk_24D173BB8;
        v18 = &v11;
        __getCBSUtilitiesClass_block_invoke((uint64_t)&v15);
        v4 = (void *)v12[3];
      }
      v5 = objc_retainAutorelease(v4);
      _Block_object_dispose(&v11, 8);
      if ((objc_msgSend(v5, "isCheckerBoardActive") & 1) == 0)
      {
        v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.enhanced-logging-state"));
        defaults = v3->_defaults;
        v3->_defaults = (NSUserDefaults *)v6;

      }
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("status"), CFSTR("consent"), CFSTR("dates"), CFSTR("queue"), CFSTR("consentHandles"), CFSTR("retriesRemaining"), CFSTR("identifiersToRetry"), CFSTR("metadata"), CFSTR("uploadCompletedPercentage"), CFSTR("followUpOptions"), CFSTR("targetDevices"), CFSTR("consentData"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ELSSnapshot refreshKeyPaths:](v3, "refreshKeyPaths:", v8);

  }
  return v3;
}

uint64_t __19__ELSSnapshot_init__block_invoke()
{
  return +[ELSEntitlementUtilities assertCurrentProcessHasEntitlement](ELSEntitlementUtilities, "assertCurrentProcessHasEntitlement");
}

- (void)refreshKeyPaths:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "containsObject:", CFSTR("status")))
    -[ELSSnapshot refreshStatus](self, "refreshStatus");
  if (objc_msgSend(v4, "containsObject:", CFSTR("consent")))
    -[ELSSnapshot refreshConsent](self, "refreshConsent");
  if (objc_msgSend(v4, "containsObject:", CFSTR("dates")))
    -[ELSSnapshot refreshDates](self, "refreshDates");
  if (objc_msgSend(v4, "containsObject:", CFSTR("queue")))
    -[ELSSnapshot refreshQueue](self, "refreshQueue");
  if (objc_msgSend(v4, "containsObject:", CFSTR("consentHandles")))
    -[ELSSnapshot refreshConsentHandles](self, "refreshConsentHandles");
  if (objc_msgSend(v4, "containsObject:", CFSTR("retriesRemaining")))
    -[ELSSnapshot refreshRetriesRemaining](self, "refreshRetriesRemaining");
  if (objc_msgSend(v4, "containsObject:", CFSTR("identifiersToRetry")))
    -[ELSSnapshot refreshIdentifiersToRetry](self, "refreshIdentifiersToRetry");
  if (objc_msgSend(v4, "containsObject:", CFSTR("metadata")))
    -[ELSSnapshot refreshMetadata](self, "refreshMetadata");
  if (objc_msgSend(v4, "containsObject:", CFSTR("uploadCompletedPercentage")))
    -[ELSSnapshot refreshUploadCompletedPercentage](self, "refreshUploadCompletedPercentage");
  if (objc_msgSend(v4, "containsObject:", CFSTR("followUpOptions")))
    -[ELSSnapshot refreshFollowUpOptions](self, "refreshFollowUpOptions");
  if (objc_msgSend(v4, "containsObject:", CFSTR("targetDevices")))
    -[ELSSnapshot refreshSessionDevice](self, "refreshSessionDevice");
  if (objc_msgSend(v4, "containsObject:", CFSTR("consentData")))
    -[ELSSnapshot refreshConsentData](self, "refreshConsentData");

}

- (void)refreshStatus
{
  void *v3;
  uint64_t v4;
  id v5;

  -[ELSSnapshot defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("status"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    v4 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v4 = 0;
  -[ELSSnapshot setStatus:](self, "setStatus:", v4);

}

- (void)refreshConsent
{
  void *v3;
  uint64_t v4;
  id v5;

  -[ELSSnapshot defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("consent"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    v4 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v4 = 0;
  -[ELSSnapshot setConsent:](self, "setConsent:", v4);

}

- (void)refreshDates
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ELSSnapshot defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("dates"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ELSSnapshot setStartDate:](self, "setStartDate:", v4);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ELSSnapshot setEndDate:](self, "setEndDate:", v5);

  }
  else
  {
    -[ELSSnapshot setStartDate:](self, "setStartDate:", 0);
    -[ELSSnapshot setEndDate:](self, "setEndDate:", 0);
  }

}

- (void)refreshQueue
{
  void *v3;
  void *v4;
  id v5;

  -[ELSSnapshot defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("queue"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ELSSnapshot decodeQueue:](self, "decodeQueue:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ELSSnapshot setQueue:](self, "setQueue:", v4);

  }
  else
  {
    -[ELSSnapshot setQueue:](self, "setQueue:", 0);
  }

}

- (void)refreshConsentHandles
{
  void *v3;
  id v4;

  -[ELSSnapshot defaults](self, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("consentHandles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSSnapshot setConsentHandles:](self, "setConsentHandles:", v3);

}

- (void)refreshSessionDevice
{
  OUTLINED_FUNCTION_0(&dword_2141BF000, a2, a3, "Could not decode enhanced logging state session device: %@", a5, a6, a7, a8, 2u);
}

- (void)refreshConsentData
{
  void *v3;
  id v4;

  -[ELSSnapshot defaults](self, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("consentData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSSnapshot setConsentData:](self, "setConsentData:", v3);

}

- (void)refreshRetriesRemaining
{
  void *v3;
  uint64_t v4;
  id v5;

  -[ELSSnapshot defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("retriesRemaining"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    v4 = objc_msgSend(v5, "integerValue");
  else
    v4 = 0;
  -[ELSSnapshot setRetriesRemaining:](self, "setRetriesRemaining:", v4);

}

- (void)refreshIdentifiersToRetry
{
  void *v3;
  id v4;

  -[ELSSnapshot defaults](self, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("identifiersToRetry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSSnapshot setIdentifiersToRetry:](self, "setIdentifiersToRetry:", v3);

}

- (void)refreshMetadata
{
  void *v3;
  id v4;

  -[ELSSnapshot defaults](self, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("metadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSSnapshot setMetadata:](self, "setMetadata:", v3);

}

- (void)refreshUploadCompletedPercentage
{
  void *v3;
  id v4;

  -[ELSSnapshot defaults](self, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("uploadCompletedPercentage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSSnapshot setUploadCompletedPercentage:](self, "setUploadCompletedPercentage:", v3);

}

- (void)refreshFollowUpOptions
{
  void *v3;
  id v4;

  -[ELSSnapshot defaults](self, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("followUpOptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSSnapshot setFollowUpOptions:](self, "setFollowUpOptions:", v3);

}

- (double)durationRemaining
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[ELSSnapshot endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[ELSSnapshot endDate](self, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;

  return v6;
}

- (double)totalDuration
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ELSSnapshot queue](self, "queue", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "executeAfterDuration");
        if (v9 > v6)
        {
          objc_msgSend(v8, "executeAfterDuration");
          v6 = v10;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (BOOL)needsFollowup
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ELSSnapshot queue](self, "queue", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "type");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        +[ELSWhitelist findEntryForBundleIdentifier:](ELSWhitelist, "findEntryForBundleIdentifier:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7 && objc_msgSend(v7, "requiresFollowup"))
        {

          LOBYTE(v3) = 1;
          goto LABEL_12;
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (NSArray)encodedQueue
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSSnapshot queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[ELSSnapshot queue](self, "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v6)
    {
      v8 = v6;
      v9 = 0;
      v10 = *(_QWORD *)v21;
      *(_QWORD *)&v7 = 138412290;
      v18 = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          v12 = v9;
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v5);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v19 = v9;
          objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v19, v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v19;

          if (v14)
          {
            objc_msgSend(v3, "addObject:", v14);
          }
          else if (v9)
          {
            ELSLogHandleForCategory(11);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v18;
              v25 = v9;
              _os_log_error_impl(&dword_2141BF000, v15, OS_LOG_TYPE_ERROR, "Could not encode enhanced logging state queue entry: %@", buf, 0xCu);
            }

          }
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v8);

    }
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v16;
}

- (id)decodeQueue:(id)a3
{
  id v3;
  id v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id obj;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v23)
  {
    v4 = 0;
    v22 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        v6 = v4;
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x24BDD1620];
        v9 = (void *)MEMORY[0x24BDBCF20];
        v10 = objc_opt_class();
        v11 = objc_opt_class();
        v12 = objc_opt_class();
        v13 = objc_opt_class();
        v14 = objc_opt_class();
        objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v6;
        objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v15, v7, &v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v24;

        if (v16)
        {
          objc_msgSend(v21, "addObject:", v16);
        }
        else if (v4)
        {
          ELSLogHandleForCategory(11);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v4;
            _os_log_error_impl(&dword_2141BF000, v17, OS_LOG_TYPE_ERROR, "Could not decode enhanced logging state queue entry: %@", buf, 0xCu);
          }

        }
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v23);

  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_status;
  v5[2] = self->_consent;
  v6 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSDate copyWithZone:](self->_endDate, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSArray copyWithZone:](self->_queue, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v5[6] = self->_retriesRemaining;
  v12 = -[NSArray copyWithZone:](self->_identifiersToRetry, "copyWithZone:", a3);
  v13 = (void *)v5[7];
  v5[7] = v12;

  v14 = -[NSDictionary copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v15 = (void *)v5[8];
  v5[8] = v14;

  v16 = -[NSNumber copyWithZone:](self->_uploadCompletedPercentage, "copyWithZone:", a3);
  v17 = (void *)v5[9];
  v5[9] = v16;

  v18 = -[NSData copyWithZone:](self->_consentData, "copyWithZone:", a3);
  v19 = (void *)v5[13];
  v5[13] = v18;

  return v5;
}

+ (id)statusToString:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 > 8)
    v3 = CFSTR("Unknown");
  else
    v3 = off_24D173BF0[a3];
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu (%@)"), a3, v3);
}

+ (id)consentToString:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 > 3)
    v3 = CFSTR("Unknown");
  else
    v3 = off_24D173C38[a3];
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu (%@)"), a3, v3);
}

- (id)dictionaryRepresentationPretty:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  _QWORD v67[13];
  _BYTE v68[128];
  uint64_t v69;

  v3 = a3;
  v69 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v5, "setLocale:", v6);

  objc_msgSend(v5, "setFormatterBehavior:", 1040);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
  -[ELSSnapshot queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[ELSSnapshot queue](self, "queue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v51 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }
  -[ELSSnapshot consentData](self, "consentData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ELSSnapshot consentData](self, "consentData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  v54 = CFSTR("status");
  if (v3)
  {
    +[ELSSnapshot statusToString:](ELSSnapshot, "statusToString:", -[ELSSnapshot status](self, "status"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v49;
    v55 = CFSTR("consent");
    +[ELSSnapshot consentToString:](ELSSnapshot, "consentToString:", -[ELSSnapshot consent](self, "consent"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ELSSnapshot status](self, "status"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v49;
    v55 = CFSTR("consent");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ELSSnapshot consent](self, "consent"));
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v48;
  v56 = CFSTR("startDate");
  -[ELSSnapshot startDate](self, "startDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:");
  v18 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v18;
  v67[2] = v18;
  v57 = CFSTR("endDate");
  -[ELSSnapshot endDate](self, "endDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:");
  v19 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v19;
  v67[3] = v19;
  v58 = CFSTR("queue");
  v20 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v20;
  v67[4] = v20;
  v59 = CFSTR("consentHandles");
  -[ELSSnapshot consentHandles](self, "consentHandles");
  v21 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v21;
  v67[5] = v21;
  v60 = CFSTR("retriesRemaining");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ELSSnapshot retriesRemaining](self, "retriesRemaining"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v67[6] = v42;
  v61 = CFSTR("identifiersToRetry");
  -[ELSSnapshot identifiersToRetry](self, "identifiersToRetry");
  v22 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v22;
  v67[7] = v22;
  v62 = CFSTR("metadata");
  -[ELSSnapshot metadata](self, "metadata");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v23;
  v67[8] = v23;
  v63 = CFSTR("uploadCompletedPercentage");
  -[ELSSnapshot uploadCompletedPercentage](self, "uploadCompletedPercentage");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v67[9] = v25;
  v64 = CFSTR("followUpOptions");
  -[ELSSnapshot followUpOptions](self, "followUpOptions", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v67[10] = v28;
  v65 = CFSTR("targetDevices");
  -[ELSSnapshot targetDevices](self, "targetDevices");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v67[11] = v30;
  v66 = CFSTR("consentData");
  v31 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v67[12] = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, &v54, 13);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (v29)
      goto LABEL_39;
  }
  else
  {

    if (v29)
      goto LABEL_39;
  }

LABEL_39:
  if (!v27)

  if (!v26)
  if (!v24)

  if (!v41)
  if (!v43)

  if (v8)
  {
    if (v44)
      goto LABEL_51;
  }
  else
  {

    if (v44)
      goto LABEL_51;
  }

LABEL_51:
  if (!v46)

  return v40;
}

- (id)dedSessionIdentifier
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  -[ELSSnapshot metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("enrollmentTicketNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(CFSTR("com.apple.enhanced-logging-state"), "stringByAppendingFormat:", CFSTR("-%@"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("com.apple.enhanced-logging-state");
  }
  v5 = v4;

  return v5;
}

- (id)JSONObject
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  -[ELSSnapshot dictionaryRepresentationPretty:](self, "dictionaryRepresentationPretty:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 1, &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v4)
  {
    ELSLogHandleForCategory(11);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ELSSnapshot JSONObject].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return v3;
}

- (id)sessionDevice
{
  void *v2;
  void *v3;

  -[ELSSnapshot targetDevices](self, "targetDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  -[ELSSnapshot JSONObject](self, "JSONObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
  }
  else
  {
    -[ELSSnapshot dictionaryRepresentationPretty:](self, "dictionaryRepresentationPretty:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)consent
{
  return self->_consent;
}

- (void)setConsent:(unint64_t)a3
{
  self->_consent = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)retriesRemaining
{
  return self->_retriesRemaining;
}

- (void)setRetriesRemaining:(int64_t)a3
{
  self->_retriesRemaining = a3;
}

- (NSArray)identifiersToRetry
{
  return self->_identifiersToRetry;
}

- (void)setIdentifiersToRetry:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersToRetry, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSNumber)uploadCompletedPercentage
{
  return self->_uploadCompletedPercentage;
}

- (void)setUploadCompletedPercentage:(id)a3
{
  objc_storeStrong((id *)&self->_uploadCompletedPercentage, a3);
}

- (NSDictionary)followUpOptions
{
  return self->_followUpOptions;
}

- (void)setFollowUpOptions:(id)a3
{
  objc_storeStrong((id *)&self->_followUpOptions, a3);
}

- (NSArray)consentHandles
{
  return self->_consentHandles;
}

- (void)setConsentHandles:(id)a3
{
  objc_storeStrong((id *)&self->_consentHandles, a3);
}

- (NSArray)targetDevices
{
  return self->_targetDevices;
}

- (void)setTargetDevices:(id)a3
{
  objc_storeStrong((id *)&self->_targetDevices, a3);
}

- (NSData)consentData
{
  return self->_consentData;
}

- (void)setConsentData:(id)a3
{
  objc_storeStrong((id *)&self->_consentData, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_consentData, 0);
  objc_storeStrong((id *)&self->_targetDevices, 0);
  objc_storeStrong((id *)&self->_consentHandles, 0);
  objc_storeStrong((id *)&self->_followUpOptions, 0);
  objc_storeStrong((id *)&self->_uploadCompletedPercentage, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifiersToRetry, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)JSONObject
{
  OUTLINED_FUNCTION_0(&dword_2141BF000, a2, a3, "Error JSON serializing ELS Snapshot = %@", a5, a6, a7, a8, 2u);
}

@end
