@implementation EDActivityPersistence

- (id)startActivityOfType:(int64_t)a3 userInfo:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  NSMutableDictionary *currentActivities;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  EDActivityHookResponder *activityHookResponder;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allValues](self->_currentActivities, "allValues", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToActivityWithType:userInfo:", a3, v6))
        {
          v12 = v11;
          currentActivities = self->_currentActivities;
          objc_msgSend(v12, "objectID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](currentActivities, "setObject:forKeyedSubscript:", 0, v14);

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E0C8]), "initWithActivityType:userInfo:", a3, v6);
  v16 = self->_currentActivities;
  objc_msgSend(v15, "objectID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, v17);

  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    activityHookResponder = self->_activityHookResponder;
    objc_msgSend(v12, "objectID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDActivityHookResponder removedActivityWithID:](activityHookResponder, "removedActivityWithID:", v19);

  }
  -[EDActivityHookResponder startedActivity:](self->_activityHookResponder, "startedActivity:", v15);

  return v15;
}

- (id)currentActivities
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allValues](self->_currentActivities, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (EDActivityPersistence)initWithHookResponder:(id)a3
{
  id v5;
  EDActivityPersistence *v6;
  EDActivityPersistence *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *currentActivities;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EDActivityPersistence;
  v6 = -[EDActivityPersistence init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityHookResponder, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    currentActivities = v7->_currentActivities;
    v7->_currentActivities = v8;

  }
  return v7;
}

- (void)activityWithID:(id)a3 finishedWithError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentActivities, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "finished"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    objc_msgSend(v8, "finishWithError:", v6);
    if ((objc_msgSend(v8, "needsPersistentHistory") & 1) == 0)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentActivities, "setObject:forKeyedSubscript:", 0, v10);

    os_unfair_lock_unlock(&self->_lock);
    -[EDActivityHookResponder activityWithID:finishedWithError:](self->_activityHookResponder, "activityWithID:finishedWithError:", v10, v6);
  }
  else
  {

    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)activityWithID:(id)a3 setUserInfoObject:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentActivities, "objectForKeyedSubscript:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInfoObject:forKey:", v8, v9);

  os_unfair_lock_unlock(&self->_lock);
  -[EDActivityHookResponder activityWithID:setUserInfoObject:forKey:](self->_activityHookResponder, "activityWithID:setUserInfoObject:forKey:", v11, v8, v9);

}

- (void)activityWithID:(id)a3 setCompletedCount:(int64_t)a4 totalCount:(int64_t)a5
{
  void *v8;
  id v9;

  v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentActivities, "objectForKeyedSubscript:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompletedCount:totalCount:", a4, a5);

  os_unfair_lock_unlock(&self->_lock);
  -[EDActivityHookResponder activityWithID:setCompletedCount:totalCount:](self->_activityHookResponder, "activityWithID:setCompletedCount:totalCount:", v9, a4, a5);

}

- (EDActivityHookResponder)activityHookResponder
{
  return self->_activityHookResponder;
}

- (void)setActivityHookResponder:(id)a3
{
  objc_storeStrong((id *)&self->_activityHookResponder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityHookResponder, 0);
  objc_storeStrong((id *)&self->_currentActivities, 0);
}

@end
