@implementation IAMMessageCoordinator

- (void)startWithApplicationContext:(id)a3 messageGroups:(id)a4
{
  -[IAMMessageCoordinator startWithApplicationContext:messageGroups:messageEntryProvider:messageMetadataStorage:propertyStorage:](self, "startWithApplicationContext:messageGroups:messageEntryProvider:messageMetadataStorage:propertyStorage:", a3, a4, 0, 0, 0);
}

- (void)startWithApplicationContext:(id)a3 messageGroups:(id)a4 messageEntryProvider:(id)a5 messageMetadataStorage:(id)a6 propertyStorage:(id)a7
{
  id v12;
  NSObject *v13;
  NSObject *accessQueue;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v12 = a4;
  IAMLogCategoryDefault();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DD38000, v13, OS_LOG_TYPE_DEFAULT, "Coordinator started", buf, 2u);
  }

  accessQueue = self->_accessQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __127__IAMMessageCoordinator_startWithApplicationContext_messageGroups_messageEntryProvider_messageMetadataStorage_propertyStorage___block_invoke;
  v16[3] = &unk_24C8710E8;
  v16[4] = self;
  v17 = v12;
  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v15 = v12;
  dispatch_async(accessQueue, v16);

}

void __120__IAMMessageCoordinator__notifyMessageTargets_withTargetIdentifier_didUpdatePriorityMessageFromEntry_observedEventName___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __120__IAMMessageCoordinator__notifyMessageTargets_withTargetIdentifier_didUpdatePriorityMessageFromEntry_observedEventName___block_invoke_2;
    v9[3] = &unk_24C871420;
    v10 = *(id *)(a1 + 72);
    objc_copyWeak(&v12, (id *)(a1 + 80));
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v4, "messageCoordinator:didUpdatePriorityMessage:fromMessageEntry:forTarget:withCompletion:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v12);
  }
  else
  {
    objc_msgSend(v3, "messageCoordinator:didUpdatePriorityMessage:forTarget:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
}

void __120__IAMMessageCoordinator__notifyMessageTargets_withTargetIdentifier_didUpdatePriorityMessageFromEntry_observedEventName___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v7 = WeakRetained;
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_processObservedEventCallbacksforEventName:willTriggerPresentation:messageIdentifier:", v5, a2, v6);

      WeakRetained = v7;
    }

  }
}

- (void)reportApplicationContextPropertiesDidChange:(id)a3
{
  id v4;
  IAMChangedContextPropertiesTriggerContext *v5;
  void *v6;
  IAMChangedContextPropertiesTriggerContext *v7;
  id v8;

  v4 = a3;
  v5 = [IAMChangedContextPropertiesTriggerContext alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IAMChangedContextPropertiesTriggerContext initWithContextPropertyNames:bundleIdentifier:](v5, "initWithContextPropertyNames:bundleIdentifier:", v4, v6);

  -[IAMMessageCoordinator reportChangedContextPropertiesContext:](self, "reportChangedContextPropertiesContext:", v7);
}

- (void)reportChangedContextPropertiesContext:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__IAMMessageCoordinator_reportChangedContextPropertiesContext___block_invoke;
  v7[3] = &unk_24C8711B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_3;
  v14[3] = &unk_24C871318;
  objc_copyWeak(&v20, (id *)(a1 + 72));
  v18 = *(_OWORD *)(a1 + 40);
  v15 = v9;
  v16 = v7;
  v17 = v8;
  v19 = *(_OWORD *)(a1 + 56);
  v11 = v8;
  v12 = v7;
  v13 = v9;
  dispatch_async(v10, v14);

  objc_destroyWeak(&v20);
}

void __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  __int128 v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_5;
  v14[3] = &unk_24C871368;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  v15 = v9;
  v16 = v7;
  v17 = v8;
  v18 = *(_OWORD *)(a1 + 40);
  v11 = v8;
  v12 = v7;
  v13 = v9;
  dispatch_async(v10, v14);

  objc_destroyWeak(&v19);
}

- (void)receiveEvent:(id)a3
{
  id v4;
  IAMReceivedEventTriggerContext *v5;
  void *v6;
  void *v7;
  IAMReceivedEventTriggerContext *v8;

  v4 = a3;
  v5 = [IAMReceivedEventTriggerContext alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IAMReceivedEventTriggerContext initWithEvent:bundleIdentifier:](v5, "initWithEvent:bundleIdentifier:", v4, v7);

  -[IAMMessageCoordinator receiveTriggerEventContext:](self, "receiveTriggerEventContext:", v8);
}

- (void)receiveTriggerEventContext:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__IAMMessageCoordinator_receiveTriggerEventContext___block_invoke;
  v7[3] = &unk_24C8711B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __127__IAMMessageCoordinator_startWithApplicationContext_messageGroups_messageEntryProvider_messageMetadataStorage_propertyStorage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v2, "_setMessageGroups:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_startStorageCoordinatorWithMessageEntryProvider:messageMetadataStorage:propertyStorage:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_setMessageGroups:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  NSDictionary *v14;
  NSDictionary *messageGroupsByGroupIdentifier;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v16 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v11, "setMessageCoordinator:", self);
          objc_msgSend(v11, "groupIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);
          }
          else
          {
            IAMLogCategoryDefault();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v22 = v11;
              _os_log_impl(&dword_20DD38000, v13, OS_LOG_TYPE_ERROR, "No group identifier specified for message group = %{public}@", buf, 0xCu);
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v8);
    }

    v14 = (NSDictionary *)objc_msgSend(v5, "copy");
    messageGroupsByGroupIdentifier = self->_messageGroupsByGroupIdentifier;
    self->_messageGroupsByGroupIdentifier = v14;

    -[IAMModalTarget setMessageGroupsByGroupIdentifier:](self->_modalTarget, "setMessageGroupsByGroupIdentifier:", self->_messageGroupsByGroupIdentifier);
    v4 = v16;
  }

}

- (void)_updatePriorityMessageEntry:(id)a3 forTargetIdentifier:(id)a4 shouldNotifyTargetsIfNonNil:(BOOL)a5 observedEventName:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  uint64_t v25;

  v7 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_priorityMessageEntryByTargetIdentifier, "objectForKeyedSubscript:", v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_messageTargetsByTargetIdentifier, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  if (v13 != v10 || (objc_msgSend(v11, "isEqualToString:", self->_modalTargetIdentifier) & 1) != 0)
  {
LABEL_5:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_priorityMessageEntryByTargetIdentifier, "setObject:forKeyedSubscript:", v10, v11);
    if (!v15)
      goto LABEL_13;
    goto LABEL_6;
  }
  if (v10)
  {
    if (!v7)
      goto LABEL_13;
    goto LABEL_5;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_messageTargetsRequiringNilPriorityMessageNotificationAfterRegistrationByTargetIdentifier, "objectForKeyedSubscript:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copy");

  if (!v22)
    goto LABEL_13;

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_priorityMessageEntryByTargetIdentifier, "setObject:forKeyedSubscript:", 0, v11);
  v15 = (void *)v22;
LABEL_6:
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_messageTargetsRequiringNilPriorityMessageNotificationAfterRegistrationByTargetIdentifier, "setObject:forKeyedSubscript:", 0, v11);
  objc_msgSend(v10, "applicationMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasHoldoutEvent");

  if (v17)
  {
    -[IAMMessageCoordinator _reportHoldoutMessageWouldAppear:](self, "_reportHoldoutMessageWouldAppear:", v10);
    IAMLogCategoryDefault();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "applicationMessage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v20;
      _os_log_impl(&dword_20DD38000, v18, OS_LOG_TYPE_DEFAULT, "Unable to display message for identifier = %{public}@. The message contains a holdoutEvent", (uint8_t *)&v23, 0xCu);

    }
    -[IAMMessageCoordinator _processObservedEventCallbacksforEventName:willTriggerPresentation:messageIdentifier:](self, "_processObservedEventCallbacksforEventName:willTriggerPresentation:messageIdentifier:", v12, 0, 0);
  }
  else
  {
    if (v10)
      -[IAMMessageEntryManager addPriorityMessageEntry:](self->_messageEntryManager, "addPriorityMessageEntry:", v10);
    -[IAMMessageCoordinator _notifyMessageTargets:withTargetIdentifier:didUpdatePriorityMessageFromEntry:observedEventName:](self, "_notifyMessageTargets:withTargetIdentifier:didUpdatePriorityMessageFromEntry:observedEventName:", v15, v11, v10, v12);
  }
LABEL_13:

}

- (void)_notifyMessageTargets:(id)a3 withTargetIdentifier:(id)a4 didUpdatePriorityMessageFromEntry:(id)a5 observedEventName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  _QWORD block[6];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id location;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v12, "applicationMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "assetPrefetchStrategy");

  if (v12)
  {
    +[IAMMessageCoordinator _createMessageFromMessageEntry:replacingResourcePathsWithCachedResourceLocations:](IAMMessageCoordinator, "_createMessageFromMessageEntry:replacingResourcePathsWithCachedResourceLocations:", v12, v15 != 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  objc_initWeak(&location, self);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v10;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v29;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v19);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __120__IAMMessageCoordinator__notifyMessageTargets_withTargetIdentifier_didUpdatePriorityMessageFromEntry_observedEventName___block_invoke;
        block[3] = &unk_24C871448;
        block[4] = v20;
        block[5] = self;
        v23 = v16;
        v24 = v12;
        v25 = v11;
        v26 = v13;
        objc_copyWeak(&v27, &location);
        dispatch_async(MEMORY[0x24BDAC9B8], block);
        objc_destroyWeak(&v27);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v17);
  }

  objc_destroyWeak(&location);
}

void __63__IAMMessageCoordinator_reportChangedContextPropertiesContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 104))
  {
    objc_msgSend(*(id *)(v2 + 96), "messageEntriesForContextPropertiesContext:", *(_QWORD *)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    +[IAMMessageEntryManager targetIdentifiersForMessageEntries:](IAMMessageEntryManager, "targetIdentifiersForMessageEntries:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_filterActiveTargetIdentifiers:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_reevaluateTargetsWithIdentifiers:forTriggerContext:shouldNotifyTargetsIfPriorityMessageNonNil:", v4, *(_QWORD *)(a1 + 40), 0);

  }
  else
  {
    objc_msgSend((id)v2, "_enqueuePendingTriggerContext:", *(_QWORD *)(a1 + 40));
  }
}

void __52__IAMMessageCoordinator_receiveTriggerEventContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 104))
  {
    objc_msgSend(*(id *)(v2 + 96), "messageEntriesByTriggerForEventContext:", *(_QWORD *)(a1 + 40));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[IAMMessageEntryManager uniqueMessageEntriesInMessageEntriesByTrigger:](IAMMessageEntryManager, "uniqueMessageEntriesInMessageEntriesByTrigger:", v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[IAMMessageEntryManager targetIdentifiersForMessageEntries:](IAMMessageEntryManager, "targetIdentifiersForMessageEntries:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_filterActiveTargetIdentifiers:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateMetadataOfMessageEntriesByTrigger:forReceivedEvent:", v8, v7);

    objc_msgSend(*(id *)(a1 + 32), "_calculateMessagesProximityAndDownloadResourcesIfNeeded:", v3);
    objc_msgSend(*(id *)(a1 + 32), "_reevaluateTargetsWithIdentifiers:forTriggerContext:shouldNotifyTargetsIfPriorityMessageNonNil:", v5, *(_QWORD *)(a1 + 40), 0);

  }
  else
  {
    objc_msgSend((id)v2, "_enqueuePendingTriggerContext:", *(_QWORD *)(a1 + 40));
  }
}

- (id)_filterActiveTargetIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)-[NSMutableDictionary copy](self->_messageTargetsByTargetIdentifier, "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (void)_reevaluateTargetsWithIdentifiers:(id)a3 forTriggerContext:(id)a4 shouldNotifyTargetsIfPriorityMessageNonNil:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  NSMutableDictionary *completionHandlersForObservedEvents;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id obj;
  _BOOL4 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v29 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = v8;
    completionHandlersForObservedEvents = self->_completionHandlersForObservedEvents;
    objc_msgSend(v9, "event");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](completionHandlersForObservedEvents, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v9, "event");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v15, "copy");

      v16 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v13 = 0;
    v9 = 0;
  }
  v16 = 1;
LABEL_7:
  if (self->_isReadyToEvaluateMessages)
  {
    if (objc_msgSend(v7, "count"))
      v17 = 1;
    else
      v17 = v16;
    if ((v17 & 1) != 0)
    {
      v26 = v9;
      v27 = v7;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      obj = v7;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v31 != v20)
              objc_enumerationMutation(obj);
            v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
            -[IAMMessageEntryManager messageEntriesForTargetIdentifier:](self->_messageEntryManager, "messageEntriesForTargetIdentifier:", v22, v26, v27);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)objc_msgSend(v23, "copy");

            +[IAMMessageEntryManager messageEntries:withSatisfiedPresentationTriggerForTriggerContext:](IAMMessageEntryManager, "messageEntries:withSatisfiedPresentationTriggerForTriggerContext:", v24, v8);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[IAMMessageCoordinator _reevaluateMessageEntries:forTargetIdentifier:shouldNotifyTargetsIfPriorityMessageNonNil:withObservedEventName:](self, "_reevaluateMessageEntries:forTargetIdentifier:shouldNotifyTargetsIfPriorityMessageNonNil:withObservedEventName:", v25, v22, v29, v13);

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v19);
      }

      v9 = v26;
      v7 = v27;
    }
    else
    {
      -[IAMMessageCoordinator _processObservedEventCallbacksforEventName:willTriggerPresentation:messageIdentifier:](self, "_processObservedEventCallbacksforEventName:willTriggerPresentation:messageIdentifier:", v13, 0, 0);
    }
  }

}

- (void)_updateMetadataOfMessageEntriesByTrigger:(id)a3 forReceivedEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
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
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v6;
  v8 = v6;
  v9 = v7;
  v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v41;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(obj);
        v32 = v10;
        v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v10);
        objc_msgSend(obj, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "nameSpacedKeyName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v34 = v12;
        v13 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v37;
          v33 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v37 != v15)
                objc_enumerationMutation(v34);
              v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_msgSend(v17, "applicationMessage");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              -[IAMMessageCoordinator _metadataEntryForMessageIdentifier:](self, "_metadataEntryForMessageIdentifier:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20;
              if (v20)
                v22 = v20;
              else
                v22 = (id)objc_opt_new();
              v23 = v22;

              v24 = objc_msgSend(v9, "type");
              if (v24)
              {
                if (v24 != 1)
                  goto LABEL_19;
                objc_msgSend(v9, "value");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setMetadataValue:forKey:", v25, v35);
              }
              else
              {
                v26 = v9;
                v27 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v23, "metadataValueForKey:", v35);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "numberWithInt:", objc_msgSend(v25, "intValue") + 1);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setMetadataValue:forKey:", v28, v35);

                v9 = v26;
                v15 = v33;
              }

LABEL_19:
              -[IAMMessageCoordinator _updateMetadata:forMessageEntry:completion:](self, "_updateMetadata:forMessageEntry:completion:", v23, v17, 0);

            }
            v14 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v14);
        }

        v10 = v32 + 1;
      }
      while (v32 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v30);
  }

}

- (void)_reevaluateMessageEntries:(id)a3 forTargetIdentifier:(id)a4 shouldNotifyTargetsIfPriorityMessageNonNil:(BOOL)a5 withObservedEventName:(id)a6
{
  NSDate *lastDisplayTimeGlobalPresentationPolicyGroupRestricted;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  IAMEvaluator *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  IAMEvaluator *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _BOOL4 v27;
  _QWORD v28[5];

  v27 = a5;
  lastDisplayTimeGlobalPresentationPolicyGroupRestricted = self->_lastDisplayTimeGlobalPresentationPolicyGroupRestricted;
  v26 = a6;
  v25 = a4;
  v10 = a3;
  v11 = (void *)-[NSDate copy](lastDisplayTimeGlobalPresentationPolicyGroupRestricted, "copy");
  v24 = (void *)-[NSDate copy](self->_lastDisplayTimeGlobalPresentationPolicyGroupNormal, "copy");
  v12 = (void *)-[NSDictionary copy](self->_metadataEntryByMessageIdentifier, "copy");
  v13 = (void *)-[NSDictionary copy](self->_messageGroupsByGroupIdentifier, "copy");
  v14 = [IAMEvaluator alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_applicationContext);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[IAMEvaluator initWithMessageEntries:metadataEntries:applicationContext:hostBundleIdentifier:messageGroups:lastDisplayTimeForRestrictedPresentationPolicyGroup:lastDisplayTimeForNormalPresentationPolicyGroup:](v14, "initWithMessageEntries:metadataEntries:applicationContext:hostBundleIdentifier:messageGroups:lastDisplayTimeForRestrictedPresentationPolicyGroup:lastDisplayTimeForNormalPresentationPolicyGroup:", v10, v12, WeakRetained, v17, v13, v11, v24);

  -[IAMEvaluator computePassingMessageEntries](v18, "computePassingMessageEntries");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __136__IAMMessageCoordinator__reevaluateMessageEntries_forTargetIdentifier_shouldNotifyTargetsIfPriorityMessageNonNil_withObservedEventName___block_invoke;
  v28[3] = &unk_24C8713B8;
  v28[4] = self;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMMessageCoordinator _updatePriorityMessageEntry:forTargetIdentifier:shouldNotifyTargetsIfNonNil:observedEventName:](self, "_updatePriorityMessageEntry:forTargetIdentifier:shouldNotifyTargetsIfNonNil:observedEventName:", v23, v25, v27, v26);

}

- (void)_calculateMessagesProximityAndDownloadResourcesIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  IAMEvaluator *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  IAMEvaluator *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  void *v25;
  IAMEvaluator *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[NSDate copy](self->_lastDisplayTimeGlobalPresentationPolicyGroupRestricted, "copy");
  v6 = (void *)-[NSDate copy](self->_lastDisplayTimeGlobalPresentationPolicyGroupNormal, "copy");
  v7 = (void *)-[NSDictionary copy](self->_metadataEntryByMessageIdentifier, "copy");
  v8 = (void *)-[NSDictionary copy](self->_messageGroupsByGroupIdentifier, "copy");
  v9 = [IAMEvaluator alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_applicationContext);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IAMEvaluator initWithMessageEntries:metadataEntries:applicationContext:hostBundleIdentifier:messageGroups:lastDisplayTimeForRestrictedPresentationPolicyGroup:lastDisplayTimeForNormalPresentationPolicyGroup:](v9, "initWithMessageEntries:metadataEntries:applicationContext:hostBundleIdentifier:messageGroups:lastDisplayTimeForRestrictedPresentationPolicyGroup:lastDisplayTimeForNormalPresentationPolicyGroup:", v4, v7, WeakRetained, v12, v8, v5, v6);

  -[IAMEvaluator computeMessagesCloseToPassingWithProximityThreshold:](v13, "computeMessagesCloseToPassingWithProximityThreshold:", 50);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v26 = v13;
    v27 = v8;
    v28 = v7;
    v29 = v6;
    v30 = v5;
    v31 = v4;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((objc_msgSend(v20, "shouldDownloadResources") & 1) == 0)
          {
            objc_msgSend(v20, "applicationMessage");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "hasHoldoutEvent");

            if ((v22 & 1) == 0)
            {
              IAMLogCategoryDefault();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v20, "applicationMessage");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "identifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v37 = v25;
                _os_log_impl(&dword_20DD38000, v23, OS_LOG_TYPE_DEFAULT, "Asking iTunesCloud to download resources for message with identifier = %{public}@", buf, 0xCu);

              }
              -[IAMStorageCoordinator downloadResourcesForMessageEntry:completion:](self->_storageCoordinator, "downloadResourcesForMessageEntry:completion:", v20, 0);
              objc_msgSend(v20, "setShouldDownloadResources:", 1);
            }
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v17);
    }

    v5 = v30;
    v4 = v31;
    v7 = v28;
    v6 = v29;
    v13 = v26;
    v8 = v27;
  }

}

- (void)setMetricsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_metricsDelegate, a3);
}

void __47__IAMMessageCoordinator_registerMessageTarget___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BYTE *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));
  }
  if ((objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 48)) & 1) == 0)
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
    }
    if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 48)) & 1) == 0)
      objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 48));

  }
  v4 = *(_BYTE **)(a1 + 32);
  if (v4[104])
  {
    v6[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_reevaluateTargetsWithIdentifiers:forTriggerContext:shouldNotifyTargetsIfPriorityMessageNonNil:", v5, 0, 1);

  }
}

void __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (!*(_QWORD *)(a1 + 32))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 48));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) + 16))();
    WeakRetained = v3;
  }

}

void __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (!*(_QWORD *)(a1 + 32))
    {
      objc_storeStrong(WeakRetained + 10, *(id *)(a1 + 40));
      objc_storeStrong(v3 + 11, *(id *)(a1 + 48));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) + 16))();
    WeakRetained = v3;
  }

}

void __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void (*v8)(void);
  id v9;

  v4 = a2;
  v5 = *(_QWORD *)(a1[5] + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (!v7)
  {
    if (v4)
    {
      v9 = v4;
      objc_storeStrong(v6, a2);
      v8 = *(void (**)(void))(a1[4] + 16);
LABEL_7:
      v8();
      v4 = v9;
      goto LABEL_8;
    }
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) && *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
      v8 = *(void (**)(void))(a1[4] + 16);
      v9 = 0;
      goto LABEL_7;
    }
  }
LABEL_8:

}

void __113__IAMMessageCoordinator__startStorageCoordinatorWithMessageEntryProvider_messageMetadataStorage_propertyStorage___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    IAMLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = 138543362;
        v14 = v9;
        _os_log_impl(&dword_20DD38000, v12, OS_LOG_TYPE_ERROR, "Failed to start storage coordinator %{public}@.", (uint8_t *)&v13, 0xCu);
      }

    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_20DD38000, v12, OS_LOG_TYPE_DEFAULT, "Storage coordinator started.", (uint8_t *)&v13, 2u);
      }

      *((_BYTE *)WeakRetained + 104) = 1;
      objc_msgSend(WeakRetained, "_handleUpdatedMessageEntries:andMetadata:", v7, v8);
      objc_msgSend(*((id *)WeakRetained + 8), "setDelegate:", *(_QWORD *)(a1 + 32));
    }
  }

}

- (void)_handleUpdatedMessageEntries:(id)a3 andMetadata:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  IAMMessageCoordinator *v23;
  id v24;
  void *v25;
  NSDictionary *v26;
  NSDictionary *metadataEntryByMessageIdentifier;
  void *v28;
  __int128 v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v8)
    {
      v10 = v8;
      v11 = 0;
      v12 = *(_QWORD *)v32;
      *(_QWORD *)&v9 = 138543618;
      v29 = v9;
      while (1)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "applicationMessage", v29);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[IAMMessageCoordinator _metadataEntryForMessageIdentifier:](self, "_metadataEntryForMessageIdentifier:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (!v7 || v16)
          {
            if (!v16)
              goto LABEL_17;
          }
          else
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", v15);
            v18 = objc_claimAutoreleasedReturnValue();
            if (!v18)
              goto LABEL_17;
            v17 = (void *)v18;
            IAMLogCategoryDefault();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v17, "allMetadataValues");
              v30 = v11;
              v20 = v10;
              v21 = v7;
              v22 = v12;
              v23 = self;
              v24 = v6;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v29;
              v36 = v25;
              v37 = 2114;
              v38 = v15;
              _os_log_impl(&dword_20DD38000, v19, OS_LOG_TYPE_DEFAULT, "Received new metadata entry = %{public}@ for message with identifier = %{public}@", buf, 0x16u);

              v6 = v24;
              self = v23;
              v12 = v22;
              v7 = v21;
              v10 = v20;
              v11 = v30;
            }

          }
          if (!v11)
            v11 = (void *)objc_opt_new();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v15);

LABEL_17:
        }
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (!v10)
          goto LABEL_21;
      }
    }
  }
  v11 = 0;
LABEL_21:
  v26 = (NSDictionary *)objc_msgSend(v11, "copy");
  metadataEntryByMessageIdentifier = self->_metadataEntryByMessageIdentifier;
  self->_metadataEntryByMessageIdentifier = v26;

  v28 = (void *)objc_msgSend(v6, "copy");
  -[IAMMessageEntryManager setMessageEntries:](self->_messageEntryManager, "setMessageEntries:", v28);

  -[IAMMessageCoordinator _evaluateMessagesForAllActiveTargets](self, "_evaluateMessagesForAllActiveTargets");
}

- (void)_evaluateMessagesForAllActiveTargets
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[IAMMessageCoordinator _dequeuePendingTriggerContexts](self, "_dequeuePendingTriggerContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_messageTargetsByTargetIdentifier, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMMessageCoordinator _reevaluateTargetsWithIdentifiers:forTriggerContext:shouldNotifyTargetsIfPriorityMessageNonNil:](self, "_reevaluateTargetsWithIdentifiers:forTriggerContext:shouldNotifyTargetsIfPriorityMessageNonNil:", v4, 0, 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[IAMMessageCoordinator receiveTriggerEventContext:](self, "receiveTriggerEventContext:", v10);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[IAMMessageCoordinator reportChangedContextPropertiesContext:](self, "reportChangedContextPropertiesContext:", v10, (_QWORD)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)_dequeuePendingTriggerContexts
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *pendingTriggerContexts;

  v3 = (void *)-[NSMutableArray copy](self->_pendingTriggerContexts, "copy");
  v4 = (NSMutableArray *)objc_opt_new();
  pendingTriggerContexts = self->_pendingTriggerContexts;
  self->_pendingTriggerContexts = v4;

  return v3;
}

- (void)_startStorageCoordinatorWithMessageEntryProvider:(id)a3 messageMetadataStorage:(id)a4 propertyStorage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  IAMStorageCoordinator *v12;
  IAMStorageCoordinator *storageCoordinator;
  _QWORD v14[5];
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IAMMessageCoordinator _messageBundleIdentifiers](self, "_messageBundleIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[IAMStorageCoordinator initWithMessageEntryProvider:messageMetadataStorage:propertyStorage:messageBundleIdentifiers:]([IAMStorageCoordinator alloc], "initWithMessageEntryProvider:messageMetadataStorage:propertyStorage:messageBundleIdentifiers:", v8, v9, v10, v11);
  storageCoordinator = self->_storageCoordinator;
  self->_storageCoordinator = v12;

  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __113__IAMMessageCoordinator__startStorageCoordinatorWithMessageEntryProvider_messageMetadataStorage_propertyStorage___block_invoke;
  v14[3] = &unk_24C8712C8;
  objc_copyWeak(&v15, &location);
  v14[4] = self;
  -[IAMMessageCoordinator _fetchMessagesAndMetadataFromStorageCoordinator:](self, "_fetchMessagesAndMetadataFromStorageCoordinator:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (id)_messageBundleIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  -[NSDictionary allKeys](self->_messageGroupsByGroupIdentifier, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (void)_fetchMessagesAndMetadataFromStorageCoordinator:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  IAMStorageCoordinator *storageCoordinator;
  IAMStorageCoordinator *v8;
  _QWORD v9[7];
  id v10;
  _QWORD v11[9];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  id location;
  _QWORD v23[3];
  char v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[3];
  char v30;
  _QWORD v31[5];
  id v32;

  v4 = a3;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__0;
  v31[4] = __Block_byref_object_dispose__0;
  v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__0;
  v27[4] = __Block_byref_object_dispose__0;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__0;
  v25[4] = __Block_byref_object_dispose__0;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  objc_initWeak(&location, self);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v5 = MEMORY[0x24BDAC760];
  v20[3] = __Block_byref_object_copy__30;
  v20[4] = __Block_byref_object_dispose__31;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke;
  v13[3] = &unk_24C8712F0;
  v15 = v31;
  v6 = v4;
  v14 = v6;
  v16 = v29;
  v17 = v23;
  v18 = v27;
  v19 = v25;
  v21 = (id)MEMORY[0x212BB42FC](v13);
  storageCoordinator = self->_storageCoordinator;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_2;
  v11[3] = &unk_24C871340;
  v11[4] = self;
  objc_copyWeak(&v12, &location);
  v11[5] = v20;
  v11[6] = v27;
  v11[7] = v25;
  v11[8] = v29;
  -[IAMStorageCoordinator fetchMessagesEntriesAndMetadata:](storageCoordinator, "fetchMessagesEntriesAndMetadata:", v11);
  v8 = self->_storageCoordinator;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __73__IAMMessageCoordinator__fetchMessagesAndMetadataFromStorageCoordinator___block_invoke_4;
  v9[3] = &unk_24C871390;
  v9[4] = self;
  objc_copyWeak(&v10, &location);
  v9[5] = v20;
  v9[6] = v23;
  -[IAMStorageCoordinator fetchGlobalPresentationPolicyGroupDisplayTimes:](v8, "fetchGlobalPresentationPolicyGroupDisplayTimes:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  _Block_object_dispose(v20, 8);

  objc_destroyWeak(&location);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

}

- (IAMMessageCoordinator)init
{
  IAMMessageCoordinator *v2;
  uint64_t v3;
  NSMutableDictionary *messageTargetsByTargetIdentifier;
  uint64_t v5;
  NSMutableDictionary *messageTargetsRequiringNilPriorityMessageNotificationAfterRegistrationByTargetIdentifier;
  uint64_t v7;
  NSMutableDictionary *priorityMessageEntryByTargetIdentifier;
  IAMImpressionManager *v9;
  IAMImpressionManager *impressionManager;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *modalTargetIdentifier;
  IAMModalTarget *v16;
  IAMModalTarget *modalTarget;
  IAMMessageEntryManager *v18;
  IAMMessageEntryManager *messageEntryManager;
  NSDictionary *messageGroupsByGroupIdentifier;
  uint64_t v21;
  NSMutableArray *pendingTriggerContexts;
  NSObject *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *accessQueue;
  uint64_t v27;
  NSMutableDictionary *completionHandlersForObservedEvents;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)IAMMessageCoordinator;
  v2 = -[IAMMessageCoordinator init](&v30, sel_init);
  if (v2)
  {
    objc_msgSend((id)_allCoordinators, "addObject:", v2);
    v3 = objc_opt_new();
    messageTargetsByTargetIdentifier = v2->_messageTargetsByTargetIdentifier;
    v2->_messageTargetsByTargetIdentifier = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    messageTargetsRequiringNilPriorityMessageNotificationAfterRegistrationByTargetIdentifier = v2->_messageTargetsRequiringNilPriorityMessageNotificationAfterRegistrationByTargetIdentifier;
    v2->_messageTargetsRequiringNilPriorityMessageNotificationAfterRegistrationByTargetIdentifier = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    priorityMessageEntryByTargetIdentifier = v2->_priorityMessageEntryByTargetIdentifier;
    v2->_priorityMessageEntryByTargetIdentifier = (NSMutableDictionary *)v7;

    v9 = objc_alloc_init(IAMImpressionManager);
    impressionManager = v2->_impressionManager;
    v2->_impressionManager = v9;

    -[IAMImpressionManager setDelegate:](v2->_impressionManager, "setDelegate:", v2);
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("ModalTarget-%@"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    modalTargetIdentifier = v2->_modalTargetIdentifier;
    v2->_modalTargetIdentifier = (NSString *)v14;

    v16 = -[IAMModalTarget initWithMessageCoordinator:targetIdentifier:]([IAMModalTarget alloc], "initWithMessageCoordinator:targetIdentifier:", v2, v2->_modalTargetIdentifier);
    modalTarget = v2->_modalTarget;
    v2->_modalTarget = v16;

    v18 = -[IAMMessageEntryManager initWithModalTargetIdentifier:]([IAMMessageEntryManager alloc], "initWithModalTargetIdentifier:", v2->_modalTargetIdentifier);
    messageEntryManager = v2->_messageEntryManager;
    v2->_messageEntryManager = v18;

    messageGroupsByGroupIdentifier = v2->_messageGroupsByGroupIdentifier;
    v2->_messageGroupsByGroupIdentifier = (NSDictionary *)MEMORY[0x24BDBD1B8];

    v21 = objc_opt_new();
    pendingTriggerContexts = v2->_pendingTriggerContexts;
    v2->_pendingTriggerContexts = (NSMutableArray *)v21;

    v2->_isReadyToEvaluateMessages = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_USER_INITIATED, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("com.apple.InAppMessages.IAMMessageCoordinator.accessQueue", v24);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v25;

    v27 = objc_opt_new();
    completionHandlersForObservedEvents = v2->_completionHandlersForObservedEvents;
    v2->_completionHandlersForObservedEvents = (NSMutableDictionary *)v27;

    -[IAMMessageCoordinator registerMessageTarget:](v2, "registerMessageTarget:", v2->_modalTarget);
  }
  return v2;
}

- (void)registerMessageTarget:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *accessQueue;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v4 = a3;
  objc_msgSend(v4, "targetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v4, "shouldBeNotifiedOfNilPriorityMessageAfterRegistration");
  else
    v6 = 0;
  accessQueue = self->_accessQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__IAMMessageCoordinator_registerMessageTarget___block_invoke;
  v10[3] = &unk_24C871110;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  v13 = v6;
  v8 = v4;
  v9 = v5;
  dispatch_async(accessQueue, v10);

}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)_allCoordinators;
    _allCoordinators = v2;

  }
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)_allCoordinators, "removeObject:", self);
  -[IAMMessageCoordinator unregisterMessageTarget:](self, "unregisterMessageTarget:", self->_modalTarget);
  v3.receiver = self;
  v3.super_class = (Class)IAMMessageCoordinator;
  -[IAMMessageCoordinator dealloc](&v3, sel_dealloc);
}

- (void)start
{
  -[IAMMessageCoordinator startWithApplicationContext:](self, "startWithApplicationContext:", 0);
}

- (void)startWithApplicationContext:(id)a3
{
  -[IAMMessageCoordinator startWithApplicationContext:messageGroups:](self, "startWithApplicationContext:messageGroups:", a3, 0);
}

- (void)unregisterMessageTarget:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "targetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__IAMMessageCoordinator_unregisterMessageTarget___block_invoke;
  block[3] = &unk_24C871138;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(accessQueue, block);

}

void __49__IAMMessageCoordinator_unregisterMessageTarget___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = v2;
    if (objc_msgSend(v2, "containsObject:", a1[6]))
      objc_msgSend(v5, "removeObject:", a1[6]);
    if (!objc_msgSend(v5, "count"))
      objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKeyedSubscript:", 0, a1[5]);
    objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      if (objc_msgSend(v3, "containsObject:", a1[6]))
        objc_msgSend(v4, "removeObject:", a1[6]);
      if (!objc_msgSend(v4, "count"))
        objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", 0, a1[5]);
    }

    v2 = v5;
  }

}

- (void)reportMessageDidAppearWithIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *accessQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__IAMMessageCoordinator_reportMessageDidAppearWithIdentifier___block_invoke;
  block[3] = &unk_24C871138;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(accessQueue, block);

}

void __62__IAMMessageCoordinator_reportMessageDidAppearWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "priorityMessageEntryForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateLastDisplayTime:forMessageEntry:", *(_QWORD *)(a1 + 48), v2);
  }
  else
  {
    IAMLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_20DD38000, v3, OS_LOG_TYPE_ERROR, "No message entry with identifier = %{public}@ couldn't report message appearance.", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)reportMessageDidAppearWithIdentifier:(id)a3 fromTargetWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __87__IAMMessageCoordinator_reportMessageDidAppearWithIdentifier_fromTargetWithIdentifier___block_invoke;
  v13[3] = &unk_24C871188;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(accessQueue, v13);

}

void __87__IAMMessageCoordinator_reportMessageDidAppearWithIdentifier_fromTargetWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "priorityMessageEntryForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    IAMLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_20DD38000, v6, OS_LOG_TYPE_ERROR, "No message entry with identifier = %{public}@ couldn't report message appearance.", buf, 0xCu);
    }
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateLastDisplayTime:forMessageEntry:", *(_QWORD *)(a1 + 48), v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "messageEntry:didAppearFromTargetWithIdentifier:atTime:", v2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "applicationMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasLocalNotification");

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_removeUserNotificationRemovalForMessageWithIdentifier:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v2, "isBadgingApplication"))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __87__IAMMessageCoordinator_reportMessageDidAppearWithIdentifier_fromTargetWithIdentifier___block_invoke_19;
    v8[3] = &unk_24C871160;
    v9 = v2;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "removeApplicationBadgeFromMessageEntry:completion:", v9, v8);

    v6 = v9;
LABEL_8:

  }
}

void __87__IAMMessageCoordinator_reportMessageDidAppearWithIdentifier_fromTargetWithIdentifier___block_invoke_19(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    IAMLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138543618;
      v7 = v4;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_20DD38000, v3, OS_LOG_TYPE_ERROR, "Error removing application badge for bundleId = %{public}@ from message with identifier = %{public}@", (uint8_t *)&v6, 0x16u);

    }
  }
}

- (void)reportMessageDidDisappearWithIdentifier:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__IAMMessageCoordinator_reportMessageDidDisappearWithIdentifier___block_invoke;
  v7[3] = &unk_24C8711B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __65__IAMMessageCoordinator_reportMessageDidDisappearWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "priorityMessageEntryForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_incrementNumberOfDisplaysForMessageEntry:", v2);
  }
  else
  {
    IAMLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_20DD38000, v3, OS_LOG_TYPE_ERROR, "No message entry with identifier = %{public}@ couldn't report message disappearance.", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)reportMessageDidDisappearWithIdentifier:(id)a3 fromTargetWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __90__IAMMessageCoordinator_reportMessageDidDisappearWithIdentifier_fromTargetWithIdentifier___block_invoke;
  v13[3] = &unk_24C871188;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  dispatch_async(accessQueue, v13);

}

uint64_t __90__IAMMessageCoordinator_reportMessageDidDisappearWithIdentifier_fromTargetWithIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 48), "messageWithIdentifier:didDisappearFromTargetWithIdentifier:atTime:", a1[5], a1[6], a1[7]);
}

- (void)reportMessageWithIdentifier:(id)a3 actionWasPerformedWithIdentifier:(id)a4
{
  -[IAMMessageCoordinator reportMessageWithIdentifier:actionWasPerformedWithIdentifier:fromTargetWithIdentifier:](self, "reportMessageWithIdentifier:actionWasPerformedWithIdentifier:fromTargetWithIdentifier:", a3, a4, 0);
}

- (void)reportMessageWithIdentifier:(id)a3 actionWasPerformedWithIdentifier:(id)a4 fromTargetWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __111__IAMMessageCoordinator_reportMessageWithIdentifier_actionWasPerformedWithIdentifier_fromTargetWithIdentifier___block_invoke;
  v15[3] = &unk_24C871188;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(accessQueue, v15);

}

void __111__IAMMessageCoordinator_reportMessageWithIdentifier_actionWasPerformedWithIdentifier_fromTargetWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "priorityMessageEntryForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "applicationMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentPages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = v5;
    v25 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v25)
    {
      v7 = *(_QWORD *)v31;
      v23 = *(_QWORD *)v31;
      v24 = v3;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v31 != v7)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "messageActions");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v27;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v27 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                objc_msgSend(v15, "identifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "isEqualToString:", *(_QWORD *)(a1 + 48));

                if (v17)
                {
                  v3 = v24;
                  objc_msgSend(*(id *)(a1 + 32), "_reportMessageAction:wasPerformedInMessageEntry:fromTargetWithIdentifier:", v15, v24, *(_QWORD *)(a1 + 56));

                  v18 = v6;
                  goto LABEL_20;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              if (v12)
                continue;
              break;
            }
          }

          v7 = v23;
        }
        v3 = v24;
        v25 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v25);
    }

    IAMLogCategoryDefault();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v37 = v19;
      v38 = 2114;
      v39 = v20;
      _os_log_impl(&dword_20DD38000, v18, OS_LOG_TYPE_ERROR, "No action with identifier = %{public}@ for message with identifier = %{public}@, couldn't report action performance.", buf, 0x16u);
    }
LABEL_20:

  }
  else
  {
    IAMLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v37 = v21;
      v38 = 2114;
      v39 = v22;
      _os_log_impl(&dword_20DD38000, v6, OS_LOG_TYPE_ERROR, "No message entry with identifier = %{public}@, couldn't report performance of action with identifier = %{public}@.", buf, 0x16u);
    }
  }

}

- (id)beginObservingTriggerEvent:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  accessQueue = self->_accessQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __64__IAMMessageCoordinator_beginObservingTriggerEvent_withHandler___block_invoke;
  v16[3] = &unk_24C8711D8;
  v16[4] = self;
  v17 = v6;
  v19 = v7;
  v10 = v8;
  v18 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_async(accessQueue, v16);
  v13 = v18;
  v14 = v10;

  return v14;
}

void __64__IAMMessageCoordinator_beginObservingTriggerEvent_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = (id)objc_opt_new();
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v5);

  }
  v6 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
  v7 = (void *)MEMORY[0x212BB42FC]();
  objc_msgSend(v8, "setObject:forKey:", v7, *(_QWORD *)(a1 + 48));

}

- (void)endObservingTriggerEvent:(id)a3 forToken:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__IAMMessageCoordinator_endObservingTriggerEvent_forToken___block_invoke;
  block[3] = &unk_24C871138;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

void __59__IAMMessageCoordinator_endObservingTriggerEvent_forToken___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  if (!objc_msgSend(v8, "count"))
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v7);

  }
}

- (void)triggerPresentationForMessageWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__IAMMessageCoordinator_triggerPresentationForMessageWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24C871250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

void __87__IAMMessageCoordinator_triggerPresentationForMessageWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "messageEntryForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "applicationMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "assetPrefetchStrategy") != 2;

    +[IAMMessageCoordinator _createMessageFromMessageEntry:replacingResourcePathsWithCachedResourceLocations:](IAMMessageCoordinator, "_createMessageFromMessageEntry:replacingResourcePathsWithCachedResourceLocations:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __87__IAMMessageCoordinator_triggerPresentationForMessageWithIdentifier_completionHandler___block_invoke_23;
    v10[3] = &unk_24C871228;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v6;
    v12 = v3;
    v13 = *(id *)(a1 + 48);
    v7 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

  }
  else
  {
    IAMLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl(&dword_20DD38000, v8, OS_LOG_TYPE_ERROR, "No message entry with identifier = %{public}@ couldn't force trigger presentation.", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __87__IAMMessageCoordinator_triggerPresentationForMessageWithIdentifier_completionHandler___block_invoke_23(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(v2 + 112);
  v5 = *(void **)(v2 + 120);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87__IAMMessageCoordinator_triggerPresentationForMessageWithIdentifier_completionHandler___block_invoke_2;
  v7[3] = &unk_24C871200;
  objc_copyWeak(&v9, &location);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v5, "messageCoordinator:didUpdatePriorityMessage:fromMessageEntry:forTarget:withCompletion:", v2, v3, v4, v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __87__IAMMessageCoordinator_triggerPresentationForMessageWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (void)reportMetricsEvent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__IAMMessageCoordinator_reportMetricsEvent___block_invoke;
  v6[3] = &unk_24C8711B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __44__IAMMessageCoordinator_reportMetricsEvent___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "metricsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "metricsDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageDidReportMetricsEvent:eventProperties:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)storageCoordinatorMessageEntriesChanged:(id)a3
{
  id v4;
  NSObject *v5;
  IAMStorageCoordinator *storageCoordinator;
  _QWORD v7[5];
  id v8;
  id buf[2];

  v4 = a3;
  IAMLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20DD38000, v5, OS_LOG_TYPE_DEFAULT, "Storage coordinator message entries changed.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  storageCoordinator = self->_storageCoordinator;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__IAMMessageCoordinator_storageCoordinatorMessageEntriesChanged___block_invoke;
  v7[3] = &unk_24C8712A0;
  v7[4] = self;
  objc_copyWeak(&v8, buf);
  -[IAMStorageCoordinator fetchMessagesEntriesAndMetadata:](storageCoordinator, "fetchMessagesEntriesAndMetadata:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);

}

void __65__IAMMessageCoordinator_storageCoordinatorMessageEntriesChanged___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__IAMMessageCoordinator_storageCoordinatorMessageEntriesChanged___block_invoke_2;
  v14[3] = &unk_24C871278;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  v15 = v9;
  v16 = v7;
  v17 = v8;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  dispatch_async(v10, v14);

  objc_destroyWeak(&v18);
}

void __65__IAMMessageCoordinator_storageCoordinatorMessageEntriesChanged___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      IAMLogCategoryDefault();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v8 = 138543362;
        v9 = v5;
        _os_log_impl(&dword_20DD38000, v4, OS_LOG_TYPE_ERROR, "Error fetching messages and metadata %{public}@.", (uint8_t *)&v8, 0xCu);
      }

      WeakRetained = v3;
      v6 = 0;
      v7 = 0;
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
    }
    objc_msgSend(WeakRetained, "_handleUpdatedMessageEntries:andMetadata:", v6, v7);
  }

}

- (void)impressionManager:(id)a3 shouldReportImpressionEventWithDictionary:(id)a4
{
  -[IAMMessageCoordinator reportMetricsEvent:](self, "reportMetricsEvent:", a4);
}

- (void)impressionManager:(id)a3 impressionDidEndForMessageEntry:(id)a4
{
  id v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__IAMMessageCoordinator_impressionManager_impressionDidEndForMessageEntry___block_invoke;
  v8[3] = &unk_24C8711B0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(accessQueue, v8);

}

uint64_t __75__IAMMessageCoordinator_impressionManager_impressionDidEndForMessageEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_incrementNumberOfDisplaysForMessageEntry:", *(_QWORD *)(a1 + 40));
}

- (void)_reportHoldoutMessageWouldAppear:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x24BDBCE60];
  v5 = a3;
  v9 = objc_alloc_init(v4);
  objc_msgSend(v5, "applicationMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "holdoutEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportableDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMMessageCoordinator reportMetricsEvent:](self, "reportMetricsEvent:", v8);

  -[IAMMessageCoordinator _incrementNumberOfDisplaysForMessageEntry:](self, "_incrementNumberOfDisplaysForMessageEntry:", v5);
  -[IAMMessageCoordinator _updateLastDisplayTime:forMessageEntry:](self, "_updateLastDisplayTime:forMessageEntry:", v9, v5);

}

- (void)_updateLastDisplayTime:(id)a3 forMessageEntry:(id)a4
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  id v12;

  v12 = a3;
  v7 = a4;
  objc_msgSend(v7, "applicationMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasGlobalPresentationPolicyGroup");

  if (v9)
  {
    objc_msgSend(v7, "applicationMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "globalPresentationPolicyGroup");

    if (v11 == 1)
    {
      objc_storeStrong((id *)&self->_lastDisplayTimeGlobalPresentationPolicyGroupRestricted, a3);
      -[IAMStorageCoordinator updateLastDisplayTimeGlobalPresentationPolicyGroupRestricted:](self->_storageCoordinator, "updateLastDisplayTimeGlobalPresentationPolicyGroupRestricted:", v12);
    }
    else if (!v11)
    {
      objc_storeStrong((id *)&self->_lastDisplayTimeGlobalPresentationPolicyGroupNormal, a3);
      -[IAMStorageCoordinator updateLastDisplayTimeGlobalPresentationPolicyGroupNormal:](self->_storageCoordinator, "updateLastDisplayTimeGlobalPresentationPolicyGroupNormal:", v12);
    }
  }

}

- (id)_metadataEntryForMessageIdentifier:(id)a3
{
  void *metadataEntryByMessageIdentifier;

  metadataEntryByMessageIdentifier = self->_metadataEntryByMessageIdentifier;
  if (metadataEntryByMessageIdentifier)
  {
    objc_msgSend(metadataEntryByMessageIdentifier, "objectForKeyedSubscript:", a3);
    metadataEntryByMessageIdentifier = (void *)objc_claimAutoreleasedReturnValue();
  }
  return metadataEntryByMessageIdentifier;
}

BOOL __136__IAMMessageCoordinator__reevaluateMessageEntries_forTargetIdentifier_shouldNotifyTargetsIfPriorityMessageNonNil_withObservedEventName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;
  _BOOL8 v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "applicationMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_metadataEntryForMessageIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "applicationMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "hasMaximumDisplays");

  if ((_DWORD)v6)
  {
    objc_msgSend(v3, "applicationMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "maximumDisplays");

    if (v10 == -1)
    {
      v13 = 1;
    }
    else
    {
      v11 = objc_msgSend(v7, "numberOfDisplays");
      objc_msgSend(v3, "applicationMessage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11 < (int)objc_msgSend(v12, "maximumDisplays");

    }
  }
  else
  {
    v13 = objc_msgSend(v7, "numberOfDisplays") == 0;
  }

  return v13;
}

uint64_t __136__IAMMessageCoordinator__reevaluateMessageEntries_forTargetIdentifier_shouldNotifyTargetsIfPriorityMessageNonNil_withObservedEventName___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "comparePriorityWithMessageEntry:");
}

- (void)_processObservedEventCallbacksforEventName:(id)a3 willTriggerPresentation:(BOOL)a4 messageIdentifier:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_completionHandlersForObservedEvents, "objectForKeyedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v15)
              (*(void (**)(uint64_t, _BOOL8, id, _QWORD))(v15 + 16))(v15, v5, v8, 0);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }
    }

  }
}

+ (id)_createMessageFromMessageEntry:(id)a3 replacingResourcePathsWithCachedResourceLocations:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v4 = a4;
  v71 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v4
    || !objc_msgSend(v5, "shouldDownloadResources")
    || (objc_msgSend(v6, "didCacheRequiredResources") & 1) == 0)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51C18]), "initWithICInAppMessageEntry:", v6);
    goto LABEL_8;
  }
  objc_msgSend(v6, "applicationMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "messageType") == 1 && objc_msgSend(v7, "hasWebArchiveURL"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51C18]), "initWithICInAppMessageEntry:", v6);
    goto LABEL_45;
  }
  v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v7, "contentPages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v47 = v7;
  objc_msgSend(v7, "contentPages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (!v53)
    goto LABEL_44;
  v51 = *(_QWORD *)v65;
  v54 = v6;
  do
  {
    for (i = 0; i != v53; ++i)
    {
      if (*(_QWORD *)v65 != v51)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
      if (objc_msgSend(v13, "imagesCount")
        && (v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v13, "imagesCount"))) != 0)
      {
        v49 = v13;
        v50 = i;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        objc_msgSend(v13, "images");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v61;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v61 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
              if (objc_msgSend(v19, "hasIdentifier") && objc_msgSend(v19, "hasURL"))
              {
                objc_msgSend(v19, "identifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "cachedLocationForResourceWithIdentifier:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21)
                {
                  v22 = objc_alloc(MEMORY[0x24BE51C08]);
                  objc_msgSend(v19, "identifier");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v21, 0);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = (void *)objc_msgSend(v22, "initWithIdentifier:url:width:height:", v23, v24, objc_msgSend(v19, "width"), objc_msgSend(v19, "height"));
                  objc_msgSend(v55, "addObject:", v25);

                  v6 = v54;
                }

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
          }
          while (v16);
        }

        v13 = v49;
        i = v50;
      }
      else
      {
        v55 = 0;
      }
      objc_msgSend(v13, "messageActions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count"))
      {
        v27 = objc_alloc(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v13, "messageActions");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v27, "initWithCapacity:", objc_msgSend(v28, "count"));

        if (!v29)
          goto LABEL_42;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        objc_msgSend(v13, "messageActions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        if (v30)
        {
          v31 = v30;
          v32 = i;
          v33 = *(_QWORD *)v57;
          do
          {
            for (k = 0; k != v31; ++k)
            {
              if (*(_QWORD *)v57 != v33)
                objc_enumerationMutation(v26);
              v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51BE8]), "initWithICAction:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k));
              objc_msgSend(v29, "addObject:", v35);

            }
            v31 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
          }
          while (v31);
          i = v32;
        }
      }
      else
      {
        v29 = 0;
      }

LABEL_42:
      v36 = objc_alloc(MEMORY[0x24BE51BF0]);
      objc_msgSend(v13, "title");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "subtitle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "body");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contentParameters");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "iam_dictionaryFromArrayOfICIIAMParameters");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v36, "initWithTitle:subtitle:body:images:actions:contentParameters:identifier:", v37, v38, v39, v55, v29, v41, v42);

      objc_msgSend(v52, "addObject:", v43);
      v6 = v54;
    }
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  }
  while (v53);
LABEL_44:

  v44 = objc_alloc(MEMORY[0x24BE51C18]);
  v7 = v47;
  objc_msgSend(v47, "identifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v44, "initWithIdentifier:messageGroupIdentifier:contentPages:requiresCloseButton:", v45, v46, v52, objc_msgSend(v47, "hasCloseButton"));

LABEL_45:
LABEL_8:

  return v8;
}

- (void)_enqueuePendingTriggerContext:(id)a3
{
  -[NSMutableArray addObject:](self->_pendingTriggerContexts, "addObject:", a3);
}

- (void)_updateMetadata:(id)a3 forMessageEntry:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *metadataEntryByMessageIdentifier;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v10, "applicationMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)-[NSDictionary mutableCopy](self->_metadataEntryByMessageIdentifier, "mutableCopy");
  if (!v13)
    v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v12);
  v14 = (NSDictionary *)objc_msgSend(v13, "copy");
  metadataEntryByMessageIdentifier = self->_metadataEntryByMessageIdentifier;
  self->_metadataEntryByMessageIdentifier = v14;

  IAMLogCategoryDefault();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "allMetadataValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v17;
    v20 = 2114;
    v21 = v12;
    _os_log_impl(&dword_20DD38000, v16, OS_LOG_TYPE_DEFAULT, "Updating metadata = %{public}@ for message entry with identifier = %{public}@", (uint8_t *)&v18, 0x16u);

  }
  -[IAMStorageCoordinator updateMetadata:forMessageEntry:completion:](self->_storageCoordinator, "updateMetadata:forMessageEntry:completion:", v8, v10, v9);

}

- (void)_reportMessageAction:(id)a3 wasPerformedInMessageEntry:(id)a4 fromTargetWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "applicationMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  IAMLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543618;
    v21 = v13;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_20DD38000, v14, OS_LOG_TYPE_DEFAULT, "Action with identifier = %{public}@ performed in message with identifier = %{public}@", (uint8_t *)&v20, 0x16u);
  }

  if (objc_msgSend(v8, "hasClickEvent"))
  {
    objc_msgSend(v9, "applicationMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "clickEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reportableDictionaryForClickEventWithMessageIdentifier:andTargetIdentifier:", v16, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[IAMMessageCoordinator reportMetricsEvent:](self, "reportMetricsEvent:", v18);
  }
  if (objc_msgSend(v8, "hasMessageRemovalPolicy"))
  {
    v19 = objc_msgSend(v8, "messageRemovalPolicy");
    if (v19 == 2)
    {
      -[IAMStorageCoordinator removeMessageEntry:completion:](self->_storageCoordinator, "removeMessageEntry:completion:", v9, 0);
      if (objc_msgSend(v11, "reportingEnabled"))
        -[IAMStorageCoordinator reportEventForMessageIdentifier:withParams:completion:](self->_storageCoordinator, "reportEventForMessageIdentifier:withParams:completion:", v12, MEMORY[0x24BDBD1B8], 0);
    }
    else if (v19 == 1)
    {
      -[IAMStorageCoordinator removeMessageEntry:completion:](self->_storageCoordinator, "removeMessageEntry:completion:", v9, 0);
    }
  }

}

- (void)_handleMessageReachedMaximumDisplayCount:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  IAMLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_20DD38000, v5, OS_LOG_TYPE_DEFAULT, "Reporting message with identifier = %{public}@ reached maximum display count.", (uint8_t *)&v6, 0xCu);
  }

  -[IAMStorageCoordinator reportEventForMessageIdentifier:withParams:completion:](self->_storageCoordinator, "reportEventForMessageIdentifier:withParams:completion:", v4, MEMORY[0x24BDBD1B8], 0);
}

- (void)_incrementNumberOfDisplaysForMessageEntry:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "applicationMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMMessageCoordinator _metadataEntryForMessageIdentifier:](self, "_metadataEntryForMessageIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  objc_msgSend(v9, "setNumberOfDisplays:", objc_msgSend(v9, "numberOfDisplays") + 1);
  -[IAMMessageCoordinator _updateMetadata:forMessageEntry:completion:](self, "_updateMetadata:forMessageEntry:completion:", v9, v16, 0);
  v10 = objc_msgSend(v9, "numberOfDisplays");
  if (objc_msgSend(v4, "hasMaximumDisplays"))
    v11 = (int)objc_msgSend(v4, "maximumDisplays");
  else
    v11 = 1;
  if (v10 >= v11)
  {
    if (objc_msgSend(v4, "reportingEnabled"))
      -[IAMMessageCoordinator _handleMessageReachedMaximumDisplayCount:](self, "_handleMessageReachedMaximumDisplayCount:", v5);
    objc_msgSend(v16, "applicationMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "targets");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[IAMMessageCoordinator _filterActiveTargetIdentifiers:](self, "_filterActiveTargetIdentifiers:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[IAMMessageCoordinator _reevaluateTargetsWithIdentifiers:forTriggerContext:shouldNotifyTargetsIfPriorityMessageNonNil:](self, "_reevaluateTargetsWithIdentifiers:forTriggerContext:shouldNotifyTargetsIfPriorityMessageNonNil:", v15, 0, 0);
  }

}

- (void)_removeUserNotificationRemovalForMessageWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IAMMessageCoordinator _metadataEntryForMessageIdentifier:](self, "_metadataEntryForMessageIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "didCancelUserNotification") & 1) == 0)
  {
    v6 = objc_alloc(MEMORY[0x24BDF88B8]);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:", v8);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("ams_"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removePendingNotificationRequestsWithIdentifiers:", v11);

    v13 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeDeliveredNotificationsWithIdentifiers:", v12);

    if (v5)
      objc_msgSend(v5, "setDidCancelUserNotification:", 1);

  }
}

- (IAMMessageMetricsDelegate)metricsDelegate
{
  return (IAMMessageMetricsDelegate *)objc_loadWeakRetained((id *)&self->_metricsDelegate);
}

- (IAMApplicationContextProvider)applicationContext
{
  return (IAMApplicationContextProvider *)objc_loadWeakRetained((id *)&self->_applicationContext);
}

- (void)setApplicationContext:(id)a3
{
  objc_storeWeak((id *)&self->_applicationContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_metricsDelegate);
  objc_storeStrong((id *)&self->_completionHandlersForObservedEvents, 0);
  objc_storeStrong((id *)&self->_messageGroupsByGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_modalTarget, 0);
  objc_storeStrong((id *)&self->_modalTargetIdentifier, 0);
  objc_storeStrong((id *)&self->_messageEntryManager, 0);
  objc_storeStrong((id *)&self->_lastDisplayTimeGlobalPresentationPolicyGroupRestricted, 0);
  objc_storeStrong((id *)&self->_lastDisplayTimeGlobalPresentationPolicyGroupNormal, 0);
  objc_storeStrong((id *)&self->_metadataEntryByMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_storageCoordinator, 0);
  objc_storeStrong((id *)&self->_pendingTriggerContexts, 0);
  objc_storeStrong((id *)&self->_impressionManager, 0);
  objc_storeStrong((id *)&self->_priorityMessageEntryByTargetIdentifier, 0);
  objc_storeStrong((id *)&self->_messageTargetsRequiringNilPriorityMessageNotificationAfterRegistrationByTargetIdentifier, 0);
  objc_storeStrong((id *)&self->_messageTargetsByTargetIdentifier, 0);
  objc_destroyWeak((id *)&self->_applicationContext);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
