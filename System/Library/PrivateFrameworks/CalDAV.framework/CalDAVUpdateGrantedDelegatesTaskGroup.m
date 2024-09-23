@implementation CalDAVUpdateGrantedDelegatesTaskGroup

- (CalDAVUpdateGrantedDelegatesTaskGroup)initWithAccountInfoProvider:(id)a3 addWriteURLs:(id)a4 addReadURLs:(id)a5 removeURLs:(id)a6 taskManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  CalDAVUpdateGrantedDelegatesTaskGroup *v15;
  CalDAVUpdateGrantedDelegatesTaskGroup *v16;
  objc_super v18;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CalDAVUpdateGrantedDelegatesTaskGroup;
  v15 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v18, sel_initWithAccountInfoProvider_taskManager_, a3, a7);
  v16 = v15;
  if (v15)
  {
    -[CalDAVUpdateGrantedDelegatesTaskGroup setState:](v15, "setState:", 0);
    -[CalDAVUpdateGrantedDelegatesTaskGroup setAddWriteURLs:](v16, "setAddWriteURLs:", v12);
    -[CalDAVUpdateGrantedDelegatesTaskGroup setAddReadURLs:](v16, "setAddReadURLs:", v13);
    -[CalDAVUpdateGrantedDelegatesTaskGroup setRemoveURLs:](v16, "setRemoveURLs:", v14);
  }

  return v16;
}

- (void)_finishWithError:(id)a3 state:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[CalDAVUpdateGrantedDelegatesTaskGroup setState:](self, "setState:", v4);
  if ((_DWORD)v4 == 6)
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logHandleForAccountInfoProvider:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2096EB000, v9, OS_LOG_TYPE_ERROR, "Finishing %{public}@ early because state machine reached an unexpected state.", (uint8_t *)&v12, 0xCu);

    }
  }
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v6, 0);

}

- (void)_fetchExistingGrantedDelegates
{
  void *v3;
  CalDAVGetGrantedDelegatesTaskGroup *v4;
  void *v5;
  void *v6;
  CalDAVGetGrantedDelegatesTaskGroup *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CalDAVUpdateGrantedDelegatesTaskGroup setState:](self, "setState:", 1);
  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "principalURL");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [CalDAVGetGrantedDelegatesTaskGroup alloc];
  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CalDAVGetGrantedDelegatesTaskGroup initWithAccountInfoProvider:principalURL:taskManager:](v4, "initWithAccountInfoProvider:principalURL:taskManager:", v5, v11, v6);
  -[CalDAVUpdateGrantedDelegatesTaskGroup setGetGrantedDelegatesTaskGroup:](self, "setGetGrantedDelegatesTaskGroup:", v7);

  -[CalDAVUpdateGrantedDelegatesTaskGroup getGrantedDelegatesTaskGroup](self, "getGrantedDelegatesTaskGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchPrincipalDetails:", 0);

  -[CalDAVUpdateGrantedDelegatesTaskGroup getGrantedDelegatesTaskGroup](self, "getGrantedDelegatesTaskGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[CalDAVUpdateGrantedDelegatesTaskGroup getGrantedDelegatesTaskGroup](self, "getGrantedDelegatesTaskGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startTaskGroup");

}

- (void)_updateDelegatesWithAllowWrite:(BOOL)a3
{
  CalDAVUpdateGrantedDelegatesTaskGroup *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  CalDAVUpdateGrantedDelegatesTaskGroup *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v3 = self;
  v38 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[CalDAVUpdateGrantedDelegatesTaskGroup setState:](self, "setState:", 3);
    v4 = CFSTR("calendar-proxy-write/");
    -[CalDAVUpdateGrantedDelegatesTaskGroup updatedWriteURLs](v3, "updatedWriteURLs");
  }
  else
  {
    -[CalDAVUpdateGrantedDelegatesTaskGroup setState:](self, "setState:", 2);
    v4 = CFSTR("calendar-proxy-read/");
    -[CalDAVUpdateGrantedDelegatesTaskGroup updatedReadURLs](v3, "updatedReadURLs");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTaskGroup accountInfoProvider](v3, "accountInfoProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "principalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CDVfixedURLByAppendingPathComponent:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x24BE1AB18]);
  v10 = *MEMORY[0x24BE1AE30];
  v11 = (void *)objc_msgSend(v9, "initWithNameSpace:andName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE60]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v30 = v8;
    v31 = v4;
    v32 = v3;
    v15 = 0;
    v16 = *(_QWORD *)v34;
    v17 = *MEMORY[0x24BE1AE70];
    do
    {
      v18 = 0;
      v19 = v15;
      do
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v12);
        v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v18);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB18]), "initWithNameSpace:andName:", v10, v17);

        objc_msgSend(v20, "CDVRawPath");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dataUsingEncoding:", 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setPayload:", v22);

        objc_msgSend(v11, "extraChildItems");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v15);

        ++v18;
        v19 = v15;
      }
      while (v14 != v18);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);

    v4 = v31;
    v3 = v32;
    v8 = v30;
  }

  v24 = objc_alloc(MEMORY[0x24BE1ABA8]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithPropertiesToSet:andRemove:atURL:", v25, 0, v8);

  -[CoreDAVTaskGroup outstandingTasks](v3, "outstandingTasks");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v26);

  -[CoreDAVTaskGroup accountInfoProvider](v3, "accountInfoProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAccountInfoProvider:", v28);

  objc_msgSend(v26, "setDelegate:", v3);
  -[CoreDAVTaskGroup taskManager](v3, "taskManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "submitQueuedCoreDAVTask:", v26);

}

- (void)_populateUpdatesFromFetched:(id)a3 allowWrite:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  if (v4)
  {
    -[CalDAVUpdateGrantedDelegatesTaskGroup addWriteURLs](self, "addWriteURLs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVUpdateGrantedDelegatesTaskGroup addReadURLs](self, "addReadURLs");
  }
  else
  {
    -[CalDAVUpdateGrantedDelegatesTaskGroup addReadURLs](self, "addReadURLs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVUpdateGrantedDelegatesTaskGroup addWriteURLs](self, "addWriteURLs");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v12);
  v9 = (void *)MEMORY[0x24BDBCEF0];
  -[CalDAVUpdateGrantedDelegatesTaskGroup removeURLs](self, "removeURLs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "unionSet:", v7);
  objc_msgSend(v11, "intersectSet:", v12);
  if (objc_msgSend(v8, "count") || objc_msgSend(v11, "count"))
  {
    objc_msgSend(v8, "unionSet:", v12);
    objc_msgSend(v8, "minusSet:", v11);
  }
  else
  {

    v8 = 0;
  }
  if (v4)
    -[CalDAVUpdateGrantedDelegatesTaskGroup setUpdatedWriteURLs:](self, "setUpdatedWriteURLs:", v8);
  else
    -[CalDAVUpdateGrantedDelegatesTaskGroup setUpdatedReadURLs:](self, "setUpdatedReadURLs:", v8);

}

- (void)taskGroup:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  CalDAVUpdateGrantedDelegatesTaskGroup *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v6, "readWritePrincipalDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "principalURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v10);
    }

    -[CalDAVUpdateGrantedDelegatesTaskGroup _populateUpdatesFromFetched:allowWrite:](self, "_populateUpdatesFromFetched:allowWrite:", v7, 1);
    objc_msgSend(v7, "removeAllObjects");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v6, "readOnlyPrincipalDetails", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "principalURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v16);
    }

    -[CalDAVUpdateGrantedDelegatesTaskGroup _populateUpdatesFromFetched:allowWrite:](self, "_populateUpdatesFromFetched:allowWrite:", v7, 0);
    -[CalDAVUpdateGrantedDelegatesTaskGroup updatedWriteURLs](self, "updatedWriteURLs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = self;
      v22 = 1;
    }
    else
    {
      -[CalDAVUpdateGrantedDelegatesTaskGroup updatedReadURLs](self, "updatedReadURLs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = self;
      if (!v23)
      {
        -[CalDAVUpdateGrantedDelegatesTaskGroup _finishWithError:state:](self, "_finishWithError:state:", 0, 7);
        goto LABEL_22;
      }
      v22 = 0;
    }
    -[CalDAVUpdateGrantedDelegatesTaskGroup _updateDelegatesWithAllowWrite:](v21, "_updateDelegatesWithAllowWrite:", v22);
LABEL_22:

    goto LABEL_23;
  }
  -[CalDAVUpdateGrantedDelegatesTaskGroup _finishWithError:state:](self, "_finishWithError:state:", a4, 4);
LABEL_23:

}

- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  CalDAVUpdateGrantedDelegatesTaskGroup *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a5;
  v7 = a3;
  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

  if (v13)
  {
    v9 = self;
    v10 = v13;
    v11 = 5;
LABEL_9:
    -[CalDAVUpdateGrantedDelegatesTaskGroup _finishWithError:state:](v9, "_finishWithError:state:", v10, v11);
    goto LABEL_10;
  }
  if (-[CalDAVUpdateGrantedDelegatesTaskGroup state](self, "state") != 3)
  {
    if (-[CalDAVUpdateGrantedDelegatesTaskGroup state](self, "state") != 2)
    {
      v9 = self;
      v10 = 0;
      v11 = 6;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  -[CalDAVUpdateGrantedDelegatesTaskGroup updatedReadURLs](self, "updatedReadURLs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_7:
    v9 = self;
    v10 = 0;
    v11 = 7;
    goto LABEL_9;
  }
  -[CalDAVUpdateGrantedDelegatesTaskGroup _updateDelegatesWithAllowWrite:](self, "_updateDelegatesWithAllowWrite:", 0);
LABEL_10:

}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSSet)addWriteURLs
{
  return self->_addWriteURLs;
}

- (void)setAddWriteURLs:(id)a3
{
  objc_storeStrong((id *)&self->_addWriteURLs, a3);
}

- (NSSet)addReadURLs
{
  return self->_addReadURLs;
}

- (void)setAddReadURLs:(id)a3
{
  objc_storeStrong((id *)&self->_addReadURLs, a3);
}

- (NSSet)removeURLs
{
  return self->_removeURLs;
}

- (void)setRemoveURLs:(id)a3
{
  objc_storeStrong((id *)&self->_removeURLs, a3);
}

- (NSSet)updatedWriteURLs
{
  return self->_updatedWriteURLs;
}

- (void)setUpdatedWriteURLs:(id)a3
{
  objc_storeStrong((id *)&self->_updatedWriteURLs, a3);
}

- (NSSet)updatedReadURLs
{
  return self->_updatedReadURLs;
}

- (void)setUpdatedReadURLs:(id)a3
{
  objc_storeStrong((id *)&self->_updatedReadURLs, a3);
}

- (CalDAVGetGrantedDelegatesTaskGroup)getGrantedDelegatesTaskGroup
{
  return self->_getGrantedDelegatesTaskGroup;
}

- (void)setGetGrantedDelegatesTaskGroup:(id)a3
{
  objc_storeStrong((id *)&self->_getGrantedDelegatesTaskGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getGrantedDelegatesTaskGroup, 0);
  objc_storeStrong((id *)&self->_updatedReadURLs, 0);
  objc_storeStrong((id *)&self->_updatedWriteURLs, 0);
  objc_storeStrong((id *)&self->_removeURLs, 0);
  objc_storeStrong((id *)&self->_addReadURLs, 0);
  objc_storeStrong((id *)&self->_addWriteURLs, 0);
}

@end
