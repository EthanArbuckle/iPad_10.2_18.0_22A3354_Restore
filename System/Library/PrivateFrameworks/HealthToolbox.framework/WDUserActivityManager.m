@implementation WDUserActivityManager

- (WDUserActivityManager)init
{
  WDUserActivityManager *v2;
  WDUserActivityManager *v3;
  UIViewController *rootViewController;
  _WDActivityNode *topNode;
  _WDActivityNode *currentNode;
  NSMutableDictionary *v7;
  NSMutableDictionary *indexedActivities;
  NSMutableArray *v9;
  NSMutableArray *policies;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WDUserActivityManager;
  v2 = -[WDUserActivityManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    rootViewController = v2->_rootViewController;
    v2->_rootViewController = 0;

    topNode = v3->_topNode;
    v3->_topNode = 0;

    currentNode = v3->_currentNode;
    v3->_currentNode = 0;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    indexedActivities = v3->_indexedActivities;
    v3->_indexedActivities = v7;

    v3->_recordActivities = 1;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    policies = v3->_policies;
    v3->_policies = v9;

  }
  return v3;
}

- (void)setRootViewController:(id)a3
{
  _WDActivityNode *v5;
  _WDActivityNode *topNode;
  _WDActivityNode *v7;
  void *currentNode;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_rootViewController, a3);
  if (objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_254DF5510))
  {
    v5 = -[_WDActivityNode initWithResponder:]([_WDActivityNode alloc], "initWithResponder:", self->_rootViewController);
    topNode = self->_topNode;
    self->_topNode = v5;

    v7 = self->_topNode;
    currentNode = self->_currentNode;
    self->_currentNode = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("_RootControllerNotResponderName"), CFSTR("The root view controller must implement the WDUserActivityResponder protocol"), 0);
    currentNode = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(currentNode, "raise");
  }

}

- (void)changeActivityForResponder:(id)a3 activityDictionary:(id)a4 title:(id)a5 keywords:(id)a6
{
  id v10;
  id v11;
  id v12;
  _WDActivityNode *v13;
  _WDActivityNode *currentNode;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (self->_recordActivities)
  {
    -[_WDActivityNode changeActivityForResponder:activityDictionary:](self->_topNode, "changeActivityForResponder:activityDictionary:", v16, v10);
    v13 = (_WDActivityNode *)objc_claimAutoreleasedReturnValue();
    currentNode = self->_currentNode;
    self->_currentNode = v13;

    if (v11)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v16, "uniqueUserActivityType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDUserActivityManager _userActivityWithTitle:keywords:activityType:](self, "_userActivityWithTitle:keywords:activityType:", v11, v12, v15);

      }
      else
      {
        -[WDUserActivityManager _userActivityWithTitle:keywords:activityType:](self, "_userActivityWithTitle:keywords:activityType:", v11, v12, *MEMORY[0x24BDD2EF8]);
      }
    }
  }

}

- (void)transitionActivityForResponder:(id)a3 newResponder:(id)a4 transitionDictionary:(id)a5
{
  _WDActivityNode *v6;
  _WDActivityNode *currentNode;

  if (self->_recordActivities)
  {
    -[_WDActivityNode transitionActivityForResponder:newResponder:transitionDictionary:](self->_topNode, "transitionActivityForResponder:newResponder:transitionDictionary:", a3, a4, a5);
    v6 = (_WDActivityNode *)objc_claimAutoreleasedReturnValue();
    currentNode = self->_currentNode;
    self->_currentNode = v6;

  }
}

- (void)restoreFromUserActivity:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[WDUserActivityManager _restoreActivityFromPolicies:](self, "_restoreActivityFromPolicies:", v8);
  v5 = v8;
  if (!v4)
  {
    objc_msgSend(v8, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("_ActivityBreadcrumbKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[WDUserActivityManager _restoreFromActivityChain:](self, "_restoreFromActivityChain:", v7);

    v5 = v8;
  }

}

- (void)_resetActivities
{
  _WDActivityNode *v3;
  _WDActivityNode *topNode;

  v3 = -[_WDActivityNode initWithResponder:]([_WDActivityNode alloc], "initWithResponder:", self->_rootViewController);
  topNode = self->_topNode;
  self->_topNode = v3;

  objc_storeStrong((id *)&self->_currentNode, self->_topNode);
  -[NSMutableDictionary removeAllObjects](self->_indexedActivities, "removeAllObjects");
}

- (id)_userActivityWithType:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDC1598];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithActivityType:", v5);

  objc_msgSend(v6, "setEligibleForHandoff:", 0);
  objc_msgSend(v6, "setEligibleForSearch:", 0);
  objc_msgSend(v6, "setEligibleForPublicIndexing:", 0);
  v7 = (void *)MEMORY[0x24BDBCF20];
  v15[0] = CFSTR("_ActivityBreadcrumbKey");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRequiredUserInfoKeys:", v9);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_WDActivityNode addActivitiesToArray:currentNode:](self->_topNode, "addActivitiesToArray:currentNode:", v10, self->_currentNode);
  v13 = CFSTR("_ActivityBreadcrumbKey");
  v14 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v11);

  return v6;
}

- (void)_userActivityWithTitle:(id)a3 keywords:(id)a4 activityType:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableDictionary objectForKey:](self->_indexedActivities, "objectForKey:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[WDUserActivityManager _userActivityWithType:](self, "_userActivityWithType:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v11, "setEligibleForSearch:", 1);
      objc_msgSend(v12, "setTitle:", v13);
      objc_msgSend(v12, "_setEligibleForPrediction:", 0);
      if (v8)
        objc_msgSend(v12, "setKeywords:", v8);
      objc_msgSend(v12, "becomeCurrent");
      -[NSMutableDictionary setObject:forKey:](self->_indexedActivities, "setObject:forKey:", v12, v13);

    }
  }

}

- (void)_restoreFromActivityChain:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WDUserActivityManager _resetActivities](self, "_resetActivities");
  -[_WDActivityNode responder](self->_topNode, "responder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = 1;
    while (2)
    {
      v11 = 0;
      v12 = v10;
      v10 ^= v8;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        if ((v12 & 1) != 0)
        {
          objc_msgSend(v5, "applyChangeActivity:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11));
          -[WDUserActivityManager _setCurrentNodeToResponder:](self, "_setCurrentNodeToResponder:", v5);
        }
        else
        {
          objc_msgSend(v5, "applyTransitionActivity:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11));
          v14 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v14;
          if (!v14)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Transition failed for breadcrumb: %@ in chain %@"), v13, v6, (_QWORD)v17);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            _HKInitializeLogging();
            v16 = *MEMORY[0x24BDD3070];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
              -[WDUserActivityManager _restoreFromActivityChain:].cold.1((uint64_t)v15, v16);

            v5 = 0;
            goto LABEL_15;
          }
        }
        v12 ^= 1u;
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

}

- (void)_setCurrentNodeToResponder:(id)a3
{
  id v4;
  _WDActivityNode *currentNode;
  id v6;
  void *v7;
  _WDActivityNode *v8;
  _WDActivityNode *v9;
  id v10;

  v4 = a3;
  currentNode = self->_currentNode;
  v10 = v4;
  if (!currentNode
    || (-[_WDActivityNode responder](currentNode, "responder"),
        v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v7 = v10,
        v6 != v10))
  {
    -[_WDActivityNode changeActivityForResponder:activityDictionary:](self->_topNode, "changeActivityForResponder:activityDictionary:", v10, 0);
    v8 = (_WDActivityNode *)objc_claimAutoreleasedReturnValue();
    v9 = self->_currentNode;
    self->_currentNode = v8;

    v7 = v10;
  }

}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 801, CFSTR("_UserActivityVersionKey"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_WDActivityNode addActivitiesToArray:currentNode:](self->_topNode, "addActivitiesToArray:currentNode:", v5, self->_currentNode);
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_UserActivityBreadcrumbArrayKey"));

}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_UserActivityVersionKey"));
  if (v5 == 801)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_UserActivityBreadcrumbArrayKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDUserActivityManager _restoreFromActivityChain:](self, "_restoreFromActivityChain:", v6);
    -[WDUserActivityManager setRecordActivities:](self, "setRecordActivities:", 0);

  }
  else
  {
    v7 = v5;
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218240;
      v10 = v7;
      v11 = 2048;
      v12 = 801;
      _os_log_impl(&dword_215814000, v8, OS_LOG_TYPE_DEFAULT, "User Activity Manager version mismatch: %ld != %ld", (uint8_t *)&v9, 0x16u);
    }
  }

}

- (void)addPolicy:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WDUserActivityManager policies](self, "policies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) == 0)
    objc_msgSend(v4, "addObject:", v5);

}

- (BOOL)_restoreActivityFromPolicies:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[WDUserActivityManager policies](self, "policies", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "decidesActivity:", v4))
        {
          objc_msgSend(v10, "activityChainForActivity:", v4);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v13 = (void *)v11;
            -[WDUserActivityManager _restoreFromActivityChain:](self, "_restoreFromActivityChain:", v11);

            v12 = 1;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (BOOL)recordActivities
{
  return self->_recordActivities;
}

- (void)setRecordActivities:(BOOL)a3
{
  self->_recordActivities = a3;
}

- (NSMutableArray)policies
{
  return self->_policies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_indexedActivities, 0);
  objc_storeStrong((id *)&self->_currentNode, 0);
  objc_storeStrong((id *)&self->_topNode, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

- (void)_restoreFromActivityChain:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215814000, a2, OS_LOG_TYPE_ERROR, "Restoration transition problem: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
