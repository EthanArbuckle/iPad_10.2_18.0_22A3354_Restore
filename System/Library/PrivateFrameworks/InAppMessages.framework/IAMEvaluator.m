@implementation IAMEvaluator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesCloseToPassing, 0);
  objc_storeStrong((id *)&self->_passingMessageEntries, 0);
  objc_storeStrong((id *)&self->_messageGroupsByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_hostBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_applicationContext);
  objc_storeStrong((id *)&self->_lastDisplayTimeForNormalPresentationPolicyGroup, 0);
  objc_storeStrong((id *)&self->_lastDisplayTimeForRestrictedPresentationPolicyGroup, 0);
  objc_storeStrong((id *)&self->_metadataEntries, 0);
  objc_storeStrong((id *)&self->_messageEntries, 0);
  objc_storeStrong((id *)&self->_currentProximityMetadata, 0);
  objc_storeStrong((id *)&self->_currentMetadata, 0);
}

- (IAMEvaluator)initWithMessageEntries:(id)a3 metadataEntries:(id)a4 applicationContext:(id)a5 hostBundleIdentifier:(id)a6 messageGroups:(id)a7 lastDisplayTimeForRestrictedPresentationPolicyGroup:(id)a8 lastDisplayTimeForNormalPresentationPolicyGroup:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  IAMEvaluator *v20;
  IAMEvaluator *v21;
  uint64_t v22;
  NSDate *lastDisplayTimeForRestrictedPresentationPolicyGroup;
  uint64_t v24;
  NSDate *lastDisplayTimeForNormalPresentationPolicyGroup;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v16 = a5;
  v27 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v30.receiver = self;
  v30.super_class = (Class)IAMEvaluator;
  v20 = -[IAMEvaluator init](&v30, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_messageEntries, a3);
    objc_storeWeak((id *)&v21->_applicationContext, v16);
    objc_storeStrong((id *)&v21->_hostBundleIdentifier, a6);
    objc_storeStrong((id *)&v21->_messageGroupsByGroupIdentifier, a7);
    objc_storeStrong((id *)&v21->_metadataEntries, a4);
    v22 = objc_msgSend(v18, "copy");
    lastDisplayTimeForRestrictedPresentationPolicyGroup = v21->_lastDisplayTimeForRestrictedPresentationPolicyGroup;
    v21->_lastDisplayTimeForRestrictedPresentationPolicyGroup = (NSDate *)v22;

    v24 = objc_msgSend(v19, "copy");
    lastDisplayTimeForNormalPresentationPolicyGroup = v21->_lastDisplayTimeForNormalPresentationPolicyGroup;
    v21->_lastDisplayTimeForNormalPresentationPolicyGroup = (NSDate *)v24;

  }
  return v21;
}

- (id)computeMessagesCloseToPassingWithProximityThreshold:(unint64_t)a3
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_messageEntries;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (-[IAMEvaluator _messageEntryProximity:](self, "_messageEntryProximity:", v11, (_QWORD)v15) >= a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  -[IAMEvaluator setMessagesCloseToPassing:](self, "setMessagesCloseToPassing:", v12);

  -[IAMEvaluator messagesCloseToPassing](self, "messagesCloseToPassing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setMessagesCloseToPassing:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSArray)messagesCloseToPassing
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (id)computePassingMessageEntries
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSDictionary *metadataEntries;
  ICInAppMessageMetadataEntry *v12;
  ICInAppMessageMetadataEntry *currentMetadata;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v24 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = self->_messageEntries;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v7);
        objc_msgSend(v8, "applicationMessage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        metadataEntries = self->_metadataEntries;
        if (metadataEntries)
        {
          -[NSDictionary objectForKeyedSubscript:](metadataEntries, "objectForKeyedSubscript:", v10);
          v12 = (ICInAppMessageMetadataEntry *)objc_claimAutoreleasedReturnValue();
          currentMetadata = self->_currentMetadata;
          self->_currentMetadata = v12;

        }
        if ((objc_msgSend((id)objc_opt_class(), "_isMessageWithinDateRange:", v8) & 1) != 0)
        {
          objc_msgSend(v8, "applicationMessage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "rule");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[IAMEvaluator _evaluateRule:forMessageEntry:](self, "_evaluateRule:forMessageEntry:", v15, v8);

          if (!v16)
            goto LABEL_17;
          if (!-[IAMEvaluator _didCacheResourcesForMessageIfRequired:](self, "_didCacheResourcesForMessageIfRequired:", v8))
          {
            IAMLogCategoryDefault();
            v17 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              goto LABEL_16;
            *(_DWORD *)buf = 138543362;
            v30 = v10;
            v18 = v17;
            v19 = "Message with identifier = %{public}@ cannot be displayed because its resources aren't cached.";
            goto LABEL_15;
          }
          if (-[IAMEvaluator _doesPresentationPolicyAllowPresentationOfMessage:](self, "_doesPresentationPolicyAllowPresentationOfMessage:", v8))
          {
            objc_msgSend(v24, "addObject:", v8);
            goto LABEL_17;
          }
          IAMLogCategoryDefault();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v10;
            v18 = v17;
            v19 = "Message with identifier = %{public}@ cannot be displayed because of its presentation policy.";
            goto LABEL_15;
          }
        }
        else
        {
          IAMLogCategoryDefault();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v30 = v10;
            v18 = v17;
            v19 = "Message with identifier = %{public}@ cannot be displayed because it's not within expected start and end date range.";
LABEL_15:
            _os_log_impl(&dword_20DD38000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
          }
        }
LABEL_16:

LABEL_17:
        ++v7;
      }
      while (v5 != v7);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      v5 = v20;
    }
    while (v20);
  }

  v21 = (void *)objc_msgSend(v24, "copy");
  -[IAMEvaluator setPassingMessageEntries:](self, "setPassingMessageEntries:", v21);

  -[IAMEvaluator passingMessageEntries](self, "passingMessageEntries");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)setPassingMessageEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)passingMessageEntries
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

+ (BOOL)applicationContext:(id)a3 allowsPresentationForPolicyGroup:(int64_t)a4 withLastDisplayTime:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  id v12;
  double v13;
  double v14;
  double v15;

  v7 = a3;
  v8 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "presentationPolicyForPolicyGroup:", a4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = 1;
    if (v8 && v9)
    {
      v12 = objc_alloc_init(MEMORY[0x24BDBCE60]);
      objc_msgSend(v12, "timeIntervalSinceDate:", v8);
      v14 = v13;
      objc_msgSend(v10, "minimumIntervalBetweenPresentations");
      v11 = v14 > v15;

    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (BOOL)_isMessageWithinDateRange:(id)a3
{
  void *v3;
  double v4;
  void *v5;
  _BOOL4 v6;
  double v7;
  void *v8;
  BOOL v9;
  BOOL v10;

  objc_msgSend(a3, "applicationMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasStartDate") && (objc_msgSend(v3, "startDate"), v4 > 0.0))
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(v3, "startDate");
    v6 = objc_msgSend(v5, "_compareCurrentTimeWithMessageTime:") == 1;
  }
  else
  {
    v6 = 1;
  }
  if (objc_msgSend(v3, "hasEndDate") && (objc_msgSend(v3, "endDate"), v7 > 0.0))
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend(v3, "endDate");
    v9 = objc_msgSend(v8, "_compareCurrentTimeWithMessageTime:") == -1;
  }
  else
  {
    v9 = 1;
  }
  v10 = v6 && v9;

  return v10;
}

+ (int64_t)_compareCurrentTimeWithMessageTime:(double)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  return v6;
}

- (BOOL)_didCacheResourcesForMessageIfRequired:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  char v7;

  v3 = a3;
  objc_msgSend(v3, "applicationMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasAssetPrefetchStrategy") & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v3, "applicationMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assetPrefetchStrategy");

  if (v6 == 2)
  {
LABEL_5:
    v7 = 1;
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "didCacheRequiredResources");
LABEL_6:

  return v7;
}

- (BOOL)_doesPresentationPolicyAllowPresentationOfMessage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  id WeakRetained;

  v4 = a3;
  objc_msgSend(v4, "applicationMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasGlobalPresentationPolicyGroup");

  if (v6)
  {
    objc_msgSend(v4, "applicationMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "globalPresentationPolicyGroup");

    v9 = objc_msgSend(MEMORY[0x24BE51C20], "presentationPolicyGroupForGlobalPresentationPolicyGroup:", v8);
    if ((_DWORD)v8 == 1)
    {
      v10 = 40;
    }
    else
    {
      if ((_DWORD)v8)
      {
        v12 = 0;
        goto LABEL_9;
      }
      v10 = 48;
    }
    v12 = *(id *)((char *)&self->super.isa + v10);
LABEL_9:
    v13 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)&self->_applicationContext);
    v11 = objc_msgSend(v13, "applicationContext:allowsPresentationForPolicyGroup:withLastDisplayTime:", WeakRetained, v9, v12);

    goto LABEL_10;
  }
  v11 = 1;
LABEL_10:

  return v11;
}

- (BOOL)_evaluateRule:(id)a3 forMessageEntry:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  int v9;
  void *v10;
  int v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
    goto LABEL_10;
  if (objc_msgSend(v7, "hasRequiredApplicationContextBundleIdentifier"))
  {
    objc_msgSend(v7, "requiredApplicationContextBundleIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend((id)v4, "isEqualToString:", self->_hostBundleIdentifier);

    if (!v9)
    {
      LOBYTE(v4) = 0;
      goto LABEL_13;
    }
  }
  objc_msgSend(v7, "triggerCondition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    goto LABEL_7;
  }
  objc_msgSend(v7, "subrules");
  v4 = objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_10:
    LOBYTE(v4) = 1;
    goto LABEL_13;
  }
LABEL_7:
  v11 = objc_msgSend(v7, "type");
  if (v11 == 1)
  {
    LOBYTE(v4) = -[IAMEvaluator _evaluateCompoundRule:forMessageEntry:](self, "_evaluateCompoundRule:forMessageEntry:", v7, v8);
  }
  else if (!v11)
  {
    objc_msgSend(v7, "triggerCondition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = -[IAMEvaluator _evaluateCondition:forMessageEntry:](self, "_evaluateCondition:forMessageEntry:", v12, v8);

  }
LABEL_13:

  return v4 & 1;
}

- (BOOL)_evaluateCompoundRule:(id)a3 forMessageEntry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v6, "subrules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IAMEvaluator _evaluateRule:forMessageEntry:](self, "_evaluateRule:forMessageEntry:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v7));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  v15 = objc_msgSend(v6, "ruleOperator");
  v16 = v15 == 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        if (v15 == 1)
        {
          if ((v16 & 1) != 0)
          {
            v16 = 1;
            continue;
          }
        }
        else
        {
          if (v15)
            continue;
          if ((v16 & 1) == 0)
          {
            v16 = 0;
            continue;
          }
        }
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "BOOLValue", (_QWORD)v23);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v19);
  }

  return v16 & 1;
}

- (id)_contextPropertyWithName:(id)a3 forMessageGroupIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_messageGroupsByGroupIdentifier, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "contextPropertyWithName:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_contextPropertyWithName:(id)a3 messageBundleIdentifier:(id)a4 conditionBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id WeakRetained;
  IAMEvaluator *v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_applicationContext);
    objc_msgSend(WeakRetained, "contextPropertyWithName:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_8;
    v15 = self;
    v16 = v8;
    v17 = v9;
LABEL_7:
    -[IAMEvaluator _contextPropertyWithName:forMessageGroupIdentifier:](v15, "_contextPropertyWithName:forMessageGroupIdentifier:", v16, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!objc_msgSend(v10, "isEqualToString:", self->_hostBundleIdentifier))
  {
    v15 = self;
    v16 = v8;
    v17 = v11;
    goto LABEL_7;
  }
  v12 = objc_loadWeakRetained((id *)&self->_applicationContext);
  objc_msgSend(v12, "contextPropertyWithName:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v13;
}

- (id)_valueForCondition:(id)a3 messageBundleIdentifier:(id)a4 messageMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "hasKind"))
  {
    if (v10)
    {
      objc_msgSend(v8, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[IAMTriggerKey nameSpacedKeyNameForName:bundleIdentifier:](IAMTriggerKey, "nameSpacedKeyNameForName:bundleIdentifier:", v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "metadataValueForKey:", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_14;
    }
    goto LABEL_8;
  }
  v11 = objc_msgSend(v8, "kind");
  if (v11 == 1)
  {
LABEL_8:
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IAMEvaluator _contextPropertyWithName:messageBundleIdentifier:conditionBundleIdentifier:](self, "_contextPropertyWithName:messageBundleIdentifier:conditionBundleIdentifier:", v12, v9, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    if (v15)
      goto LABEL_14;
    goto LABEL_10;
  }
  if (!v11 && v10)
  {
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[IAMTriggerKey nameSpacedKeyNameForName:bundleIdentifier:](IAMTriggerKey, "nameSpacedKeyNameForName:bundleIdentifier:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "metadataValueForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
LABEL_10:
  if (objc_msgSend(v8, "dataType") == 2 && !objc_msgSend(v8, "triggerConditionType"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_14:

  return v15;
}

- (BOOL)_evaluateCondition:(id)a3 forMessageEntry:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  char v13;
  char v14;

  v6 = a3;
  objc_msgSend(a4, "bundleIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  -[IAMEvaluator _valueForCondition:messageBundleIdentifier:messageMetadata:](self, "_valueForCondition:messageBundleIdentifier:messageMetadata:", v6, v7, self->_currentMetadata);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "dataType");
  if ((!v9 || v9 == 2 || v9 == 1) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    switch(objc_msgSend(v6, "comparisonType"))
    {
      case 0u:
        v10 = objc_msgSend(v6, "dataType");
        if (v10)
        {
          if (v10 == 2)
          {
            LODWORD(v7) = objc_msgSend(v8, "intValue");
            objc_msgSend(v6, "triggerValue");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v7) = (_DWORD)v7 == objc_msgSend(v11, "intValue");
          }
          else
          {
            if (v10 != 1)
              goto LABEL_11;
            objc_msgSend(v6, "triggerValue");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v7) = objc_msgSend(v8, "isEqualToString:", v11);
          }
        }
        else
        {
          v14 = objc_msgSend(v8, "BOOLValue");
          objc_msgSend(v6, "triggerValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v7) = v14 ^ objc_msgSend(v11, "BOOLValue") ^ 1;
        }
        goto LABEL_23;
      case 1u:
LABEL_11:
        v12 = objc_msgSend(v6, "dataType");
        if (v12)
        {
          if (v12 == 2)
          {
            LODWORD(v7) = objc_msgSend(v8, "intValue");
            objc_msgSend(v6, "triggerValue");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v7) = (_DWORD)v7 != objc_msgSend(v11, "intValue");
          }
          else if (v12 == 1)
          {
            objc_msgSend(v6, "triggerValue");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v7) = objc_msgSend(v8, "isEqualToString:", v11) ^ 1;
          }
          else
          {
LABEL_15:
            LODWORD(v7) = objc_msgSend(v8, "intValue");
            objc_msgSend(v6, "triggerValue");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v7) = (int)v7 < (int)objc_msgSend(v11, "intValue");
          }
        }
        else
        {
          v13 = objc_msgSend(v8, "BOOLValue");
          objc_msgSend(v6, "triggerValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v7) = v13 ^ objc_msgSend(v11, "BOOLValue");
        }
LABEL_23:

        break;
      case 2u:
        goto LABEL_15;
      case 3u:
        LODWORD(v7) = objc_msgSend(v8, "intValue");
        objc_msgSend(v6, "triggerValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v7) = (int)v7 <= (int)objc_msgSend(v11, "intValue");
        goto LABEL_23;
      case 4u:
        LODWORD(v7) = objc_msgSend(v8, "intValue");
        objc_msgSend(v6, "triggerValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v7) = (int)v7 > (int)objc_msgSend(v11, "intValue");
        goto LABEL_23;
      case 5u:
        LODWORD(v7) = objc_msgSend(v8, "intValue");
        objc_msgSend(v6, "triggerValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v7) = (int)v7 >= (int)objc_msgSend(v11, "intValue");
        goto LABEL_23;
      default:
        break;
    }
  }

  return v7 & 1;
}

- (unint64_t)_messageEntryProximity:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *metadataEntries;
  void *v7;
  void *v8;
  ICInAppMessageMetadataEntry *v9;
  ICInAppMessageMetadataEntry *currentProximityMetadata;
  void *v11;
  void *v12;
  unint64_t v13;

  v4 = a3;
  v5 = v4;
  metadataEntries = self->_metadataEntries;
  if (metadataEntries)
  {
    objc_msgSend(v4, "applicationMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](metadataEntries, "objectForKeyedSubscript:", v8);
    v9 = (ICInAppMessageMetadataEntry *)objc_claimAutoreleasedReturnValue();
    currentProximityMetadata = self->_currentProximityMetadata;
    self->_currentProximityMetadata = v9;

  }
  objc_msgSend(v5, "applicationMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IAMEvaluator _calculateRuleProximity:forMessageEntry:](self, "_calculateRuleProximity:forMessageEntry:", v12, v5);

  return v13;
}

- (unint64_t)_calculateRuleProximity:(id)a3 forMessageEntry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  unint64_t v14;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_10;
  if (objc_msgSend(v6, "hasRequiredApplicationContextBundleIdentifier"))
  {
    objc_msgSend(v6, "requiredApplicationContextBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", self->_hostBundleIdentifier);

    if (!v9)
    {
LABEL_11:
      v14 = 0;
      goto LABEL_13;
    }
  }
  objc_msgSend(v6, "triggerCondition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    goto LABEL_7;
  }
  objc_msgSend(v6, "subrules");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_10:
    v14 = 100;
    goto LABEL_13;
  }
LABEL_7:
  v12 = objc_msgSend(v6, "type");
  if (v12 == 1)
  {
    v14 = -[IAMEvaluator _calculateCompoundRuleProximity:forMessageEntry:](self, "_calculateCompoundRuleProximity:forMessageEntry:", v6, v7);
    goto LABEL_13;
  }
  if (v12)
    goto LABEL_11;
  objc_msgSend(v6, "triggerCondition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[IAMEvaluator _calculateConditionProximity:forMessageEntry:](self, "_calculateConditionProximity:forMessageEntry:", v13, v7);

LABEL_13:
  return v14;
}

- (unint64_t)_calculateCompoundRuleProximity:(id)a3 forMessageEntry:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[6];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v29 = a4;
  v7 = (void *)objc_opt_new();
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v28 = v6;
  objc_msgSend(v6, "subrules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __64__IAMEvaluator__calculateCompoundRuleProximity_forMessageEntry___block_invoke;
  v42[3] = &unk_24C8716A0;
  v42[4] = &v47;
  v42[5] = &v43;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v42);

  v9 = !objc_msgSend(v28, "ruleOperator") && v48[3] && v44[3] != 0;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v28, "subrules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v39;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v13);
        if (!v9 || (objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v13), "isExactMatchRule") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[IAMEvaluator _calculateRuleProximity:forMessageEntry:](self, "_calculateRuleProximity:forMessageEntry:", v14, v29));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v28, "ruleOperator"))
  {
    if (objc_msgSend(v28, "ruleOperator") == 1)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v16 = v7;
      v17 = 0;
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v51, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v31;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v31 != v19)
              objc_enumerationMutation(v16);
            v21 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v20), "unsignedIntegerValue");
            if (v17 <= v21)
              v17 = v21;
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v51, 16);
        }
        while (v18);
      }

    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v22 = v7;
    v23 = 0;
    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v35;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v22);
          v23 += objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v26++), "unsignedIntegerValue");
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
      }
      while (v24);
    }

    v17 = v23 / objc_msgSend(v22, "count");
  }
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v17;
}

uint64_t __64__IAMEvaluator__calculateCompoundRuleProximity_forMessageEntry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "isExactMatchRule");
  if ((_DWORD)result)
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = *(_QWORD *)(a1 + 40);
  ++*(_QWORD *)(*(_QWORD *)(v4 + 8) + 24);
  return result;
}

- (unint64_t)_calculateConditionProximity:(id)a3 forMessageEntry:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  BOOL v12;
  int v13;
  BOOL v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  int v40;
  void *v41;
  int v42;
  unint64_t v43;
  int v44;
  int v45;
  void *v46;
  int v47;
  int v48;
  int v49;
  void *v50;
  int v51;
  int v52;
  void *v53;
  int v54;
  int v55;

  v6 = a3;
  objc_msgSend(a4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMEvaluator _valueForCondition:messageBundleIdentifier:messageMetadata:](self, "_valueForCondition:messageBundleIdentifier:messageMetadata:", v6, v7, self->_currentProximityMetadata);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "dataType");
  if ((!v9 || v9 == 2 || v9 == 1) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_27:
    v43 = 0;
  }
  else
  {
    switch(objc_msgSend(v6, "comparisonType"))
    {
      case 0u:
        v10 = objc_msgSend(v6, "dataType");
        switch(v10)
        {
          case 0:
            v48 = objc_msgSend(v8, "BOOLValue");
            objc_msgSend(v6, "triggerValue");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v48 == objc_msgSend(v11, "BOOLValue");
LABEL_36:
            if (v14)
              v43 = 100;
            else
              v43 = 0;
            goto LABEL_46;
          case 2:
            v49 = objc_msgSend(v8, "intValue");
            objc_msgSend(v6, "triggerValue");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v50, "intValue");

            if (v49 != v51)
            {
              v52 = objc_msgSend(v8, "intValue");
              objc_msgSend(v6, "triggerValue");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v53, "intValue");

              v55 = objc_msgSend(v8, "intValue");
              v32 = v55;
              if (v52 < v54)
              {
                v35 = 100 * v55;
LABEL_43:
                objc_msgSend(v6, "triggerValue");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = v36;
                goto LABEL_44;
              }
LABEL_22:
              objc_msgSend(v6, "triggerValue");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "intValue");

              if (v32 <= v34)
                goto LABEL_27;
LABEL_23:
              objc_msgSend(v6, "triggerValue");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = 100 * objc_msgSend(v11, "intValue");
              v36 = v8;
LABEL_44:
              v28 = v35 / (int)objc_msgSend(v36, "intValue");
LABEL_45:
              v43 = v28;
              goto LABEL_46;
            }
LABEL_40:
            v43 = 100;
            goto LABEL_47;
          case 1:
            objc_msgSend(v6, "triggerValue");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v8, "isEqualToString:", v11) == 0;
            goto LABEL_29;
        }
LABEL_10:
        v13 = objc_msgSend(v6, "dataType");
        if (!v13)
        {
          v44 = objc_msgSend(v8, "BOOLValue");
          objc_msgSend(v6, "triggerValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v44 == objc_msgSend(v11, "BOOLValue");
LABEL_29:
          if (v12)
            v43 = 0;
          else
            v43 = 100;
LABEL_46:

          break;
        }
        if (v13 != 2)
        {
          if (v13 == 1)
          {
            objc_msgSend(v6, "triggerValue");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v8, "isEqualToString:", v11) == 0;
            goto LABEL_36;
          }
LABEL_14:
          v15 = objc_msgSend(v8, "intValue");
          objc_msgSend(v6, "triggerValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "intValue");

          if (v15 >= v17)
          {
            v18 = objc_msgSend(v8, "intValue");
            objc_msgSend(v6, "triggerValue");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "intValue");

            if (v18 < v20)
              goto LABEL_27;
            goto LABEL_23;
          }
          goto LABEL_40;
        }
        v45 = objc_msgSend(v8, "intValue");
        objc_msgSend(v6, "triggerValue");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "intValue");

        if (v45 == v47)
          v43 = 0;
        else
          v43 = 100;
        break;
      case 1u:
        goto LABEL_10;
      case 2u:
        goto LABEL_14;
      case 3u:
        v29 = objc_msgSend(v8, "intValue");
        objc_msgSend(v6, "triggerValue");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "intValue");

        if (v29 <= v31)
          goto LABEL_40;
        v32 = objc_msgSend(v8, "intValue");
        goto LABEL_22;
      case 4u:
        v21 = objc_msgSend(v8, "intValue");
        objc_msgSend(v6, "triggerValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "intValue");

        if (v21 > v23)
          goto LABEL_40;
        v24 = objc_msgSend(v8, "intValue");
        objc_msgSend(v6, "triggerValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "intValue");

        if (v24 > v26)
          goto LABEL_27;
        v27 = 100 * objc_msgSend(v8, "intValue");
        objc_msgSend(v6, "triggerValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27 / (int)(objc_msgSend(v11, "intValue") + 1);
        goto LABEL_45;
      case 5u:
        v37 = objc_msgSend(v8, "intValue");
        objc_msgSend(v6, "triggerValue");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "intValue");

        if (v37 >= v39)
          goto LABEL_40;
        v40 = objc_msgSend(v8, "intValue");
        objc_msgSend(v6, "triggerValue");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "intValue");

        if (v40 >= v42)
          goto LABEL_27;
        v35 = 100 * objc_msgSend(v8, "intValue");
        goto LABEL_43;
      default:
        goto LABEL_27;
    }
  }
LABEL_47:

  return v43;
}

@end
