@implementation IAMImpressionManager

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IAMImpressionManager)init
{
  IAMImpressionManager *v2;
  IAMImpressionManager *v3;
  uint64_t v4;
  NSMutableDictionary *activeImpressionForMessageIdentifierFromTargetIdentifier;
  uint64_t v6;
  NSMutableDictionary *inactiveImpressionForMessageIdentifierFromTargetIdentifier;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IAMImpressionManager;
  v2 = -[IAMImpressionManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    activeImpressionForMessageIdentifierFromTargetIdentifier = v3->_activeImpressionForMessageIdentifierFromTargetIdentifier;
    v3->_activeImpressionForMessageIdentifierFromTargetIdentifier = (NSMutableDictionary *)v4;

    v6 = objc_opt_new();
    inactiveImpressionForMessageIdentifierFromTargetIdentifier = v3->_inactiveImpressionForMessageIdentifierFromTargetIdentifier;
    v3->_inactiveImpressionForMessageIdentifierFromTargetIdentifier = (NSMutableDictionary *)v6;

    os_unfair_lock_lock(&v3->_lock);
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_isApplicationActive = objc_msgSend(v8, "applicationState") == 0;

    os_unfair_lock_unlock(&v3->_lock);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel__handleApplicationDidBecomeActive, *MEMORY[0x24BDF7510], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel__handleApplicationWillResignActive, *MEMORY[0x24BDF75D8], 0);

  }
  return v3;
}

- (void)_transitionToActiveState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *inactiveImpressionForMessageIdentifierFromTargetIdentifier;
  os_unfair_lock_t lock;
  NSMutableDictionary *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isApplicationActive = 1;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v7), lock);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setDisplayStartTime:", v3);
              objc_msgSend(v13, "setDisplayEndTime:", 0);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  objc_storeStrong((id *)&self->_activeImpressionForMessageIdentifierFromTargetIdentifier, self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier);
  v14 = (NSMutableDictionary *)objc_opt_new();
  inactiveImpressionForMessageIdentifierFromTargetIdentifier = self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier;
  self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier = v14;

  os_unfair_lock_unlock(lock);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7510], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D8], 0);

  v4.receiver = self;
  v4.super_class = (Class)IAMImpressionManager;
  -[IAMImpressionManager dealloc](&v4, sel_dealloc);
}

- (void)messageEntry:(id)a3 didAppearFromTargetWithIdentifier:(id)a4 atTime:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!-[IAMImpressionManager _startImpressionForMessageEntry:fromTargetWithIdentifier:displayStartTime:](self, "_startImpressionForMessageEntry:fromTargetWithIdentifier:displayStartTime:", v8, v9, a5))
  {
    IAMLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "applicationMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_20DD38000, v10, OS_LOG_TYPE_DEFAULT, "Appearance has already been reported for message with identifier = %{public}@ from target with identifier = %{public}@", (uint8_t *)&v13, 0x16u);

    }
  }

}

- (void)messageWithIdentifier:(id)a3 didDisappearFromTargetWithIdentifier:(id)a4 atTime:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!-[IAMImpressionManager _endImpressionForMessageWithIdentifier:fromTargetWithIdentifier:displayEndTime:](self, "_endImpressionForMessageWithIdentifier:fromTargetWithIdentifier:displayEndTime:", v8, v9, a5))
  {
    IAMLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_20DD38000, v10, OS_LOG_TYPE_DEFAULT, "Appearance of message with identifier = %{public}@ has not previously been reported from target with identifier = %{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
}

- (BOOL)_startImpressionForMessageEntry:(id)a3 fromTargetWithIdentifier:(id)a4 displayStartTime:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock(&self->_lock);
  v11 = 8;
  if (!self->_isApplicationActive)
    v11 = 16;
  v12 = *(id *)((char *)&self->super.isa + v11);
  objc_msgSend(v8, "applicationMessage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, v14);
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51C10]), "initWithMessageEntry:targetIdentifier:", v8, v9);
    v18 = v17;
    if (self->_isApplicationActive)
      objc_msgSend(v17, "setDisplayStartTime:", v10);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, v9);

  }
  os_unfair_lock_unlock(&self->_lock);

  return v16 == 0;
}

- (BOOL)_endImpressionForMessageWithIdentifier:(id)a3 fromTargetWithIdentifier:(id)a4 displayEndTime:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock(&self->_lock);
  v11 = 8;
  if (!self->_isApplicationActive)
    v11 = 16;
  v12 = *(id *)((char *)&self->super.isa + v11);
  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 != 0;
    if (v15)
    {
      objc_msgSend(v14, "removeObjectForKey:", v9);
      if (!objc_msgSend(v14, "count"))
        objc_msgSend(v12, "removeObjectForKey:", v8);
      if (self->_isApplicationActive)
      {
        objc_msgSend(v15, "setDisplayEndTime:", v10);
        -[IAMImpressionManager _reportImpression:](self, "_reportImpression:", v15);
      }
    }

  }
  else
  {
    v16 = 0;
  }

  os_unfair_lock_unlock(&self->_lock);
  return v16;
}

- (void)_transitionToInactiveState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *activeImpressionForMessageIdentifierFromTargetIdentifier;
  os_unfair_lock_t lock;
  NSMutableDictionary *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isApplicationActive = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_activeImpressionForMessageIdentifierFromTargetIdentifier;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_activeImpressionForMessageIdentifierFromTargetIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v7), lock);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setDisplayEndTime:", v3);
              -[IAMImpressionManager _reportImpression:](self, "_reportImpression:", v13);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v10);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  objc_storeStrong((id *)&self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier, self->_activeImpressionForMessageIdentifierFromTargetIdentifier);
  v14 = (NSMutableDictionary *)objc_opt_new();
  activeImpressionForMessageIdentifierFromTargetIdentifier = self->_activeImpressionForMessageIdentifierFromTargetIdentifier;
  self->_activeImpressionForMessageIdentifierFromTargetIdentifier = v14;

  os_unfair_lock_unlock(lock);
}

- (void)_reportImpression:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const char *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "displayStartTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    IAMLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "messageIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "targetIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      v15 = "Impression for message with identifier = %{public}@ from target with identifier = %{public}@ could not be re"
            "ported without a display start time";
LABEL_12:
      _os_log_impl(&dword_20DD38000, v12, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 0x16u);

    }
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v4, "displayEndTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    IAMLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "messageIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "targetIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v14;
      v15 = "Impression for message with identifier = %{public}@ from target with identifier = %{public}@ could not be re"
            "ported without a display end time";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  -[IAMImpressionManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[IAMImpressionManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "impressionManager:impressionDidEndForMessageEntry:", self, v10);

  }
  objc_msgSend(v4, "reportableMetricsEventDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[IAMImpressionManager _reportImpressionEventWithDictionary:](self, "_reportImpressionEventWithDictionary:", v11);

LABEL_14:
}

- (void)_reportImpressionEventWithDictionary:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[IAMImpressionManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[IAMImpressionManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "impressionManager:shouldReportImpressionEventWithDictionary:", self, v7);

  }
}

- (IAMImpressionManagerDelegate)delegate
{
  return (IAMImpressionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inactiveImpressionForMessageIdentifierFromTargetIdentifier, 0);
  objc_storeStrong((id *)&self->_activeImpressionForMessageIdentifierFromTargetIdentifier, 0);
}

@end
