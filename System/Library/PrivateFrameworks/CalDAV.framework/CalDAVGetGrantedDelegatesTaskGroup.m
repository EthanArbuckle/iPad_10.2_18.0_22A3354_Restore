@implementation CalDAVGetGrantedDelegatesTaskGroup

- (CalDAVGetGrantedDelegatesTaskGroup)initWithAccountInfoProvider:(id)a3 principalURL:(id)a4 taskManager:(id)a5
{
  CalDAVGetGrantedDelegatesTaskGroup *v5;
  CalDAVGetGrantedDelegatesTaskGroup *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CalDAVGetGrantedDelegatesTaskGroup;
  v5 = -[CalDAVGetDelegatesBaseTaskGroup initWithAccountInfoProvider:principalURL:taskManager:](&v8, sel_initWithAccountInfoProvider_principalURL_taskManager_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[CalDAVGetGrantedDelegatesTaskGroup setState:](v5, "setState:", 0);
    -[CalDAVGetGrantedDelegatesTaskGroup setFetchPrincipalDetails:](v6, "setFetchPrincipalDetails:", 1);
  }
  return v6;
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
  -[CalDAVGetGrantedDelegatesTaskGroup setState:](self, "setState:", v4);
  if ((_DWORD)v4 == 9)
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

- (void)_fetchOnlyHrefs
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CalDAVGetGrantedDelegatesTaskGroup setState:](self, "setState:", 3);
  v3 = objc_alloc(MEMORY[0x24BE1AB20]);
  v11 = (id)objc_msgSend(v3, "initWithNameSpace:name:parseClass:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE60], objc_opt_class());
  v4 = objc_alloc(MEMORY[0x24BE1ABA0]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVGetDelegatesBaseTaskGroup principalURL](self, "principalURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithPropertiesToFind:atURL:withDepth:", v5, v6, 3);

  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccountInfoProvider:", v9);

  objc_msgSend(v7, "setDelegate:", self);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitQueuedCoreDAVTask:", v7);

}

- (id)_urlAppendingSegmentWithAllowWrite:(BOOL)a3
{
  __CFString **v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v4 = cdWriteProxyChildSegment;
  if (!a3)
    v4 = cdReadProxyChildSegment;
  v5 = *v4;
  -[CalDAVGetDelegatesBaseTaskGroup principalURL](self, "principalURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CDVfixedURLByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_expandPropertiesWithAllowWrite:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  if (a3)
    v5 = 1;
  else
    v5 = 2;
  -[CalDAVGetGrantedDelegatesTaskGroup setState:](self, "setState:", v5);
  -[CalDAVGetGrantedDelegatesTaskGroup _urlAppendingSegmentWithAllowWrite:](self, "_urlAppendingSegmentWithAllowWrite:", v3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVGetDelegatesBaseTaskGroup _mappingsForPrincipalDetails](self, "_mappingsForPrincipalDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BE1AAF8]);
  v8 = (void *)objc_msgSend(v7, "initWithPropertiesToFind:atURL:expandedName:expandedNameSpace:", v6, v12, *MEMORY[0x24BE1AE60], *MEMORY[0x24BE1AE30]);
  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccountInfoProvider:", v10);

  objc_msgSend(v8, "setDelegate:", self);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitQueuedCoreDAVTask:", v8);

}

- (void)_getChildProperties
{
  void *v3;
  CalDAVGetGrantedDelegatesTaskGroup *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[CalDAVGetDelegatesBaseTaskGroup readPrincipalURLs](self, "readPrincipalURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVGetDelegatesBaseTaskGroup _popFromArray:](self, "_popFromArray:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v4 = self;
    v5 = 4;
LABEL_5:
    -[CalDAVGetGrantedDelegatesTaskGroup setState:](v4, "setState:", v5);
    -[CalDAVGetDelegatesBaseTaskGroup _getPrincipalDetailsForURL:](self, "_getPrincipalDetailsForURL:", v7);

    return;
  }
  -[CalDAVGetDelegatesBaseTaskGroup writePrincipalURLs](self, "writePrincipalURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVGetDelegatesBaseTaskGroup _popFromArray:](self, "_popFromArray:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v4 = self;
    v5 = 5;
    goto LABEL_5;
  }
  -[CalDAVGetGrantedDelegatesTaskGroup _finishWithError:state:](self, "_finishWithError:state:", 0, 10);
}

- (void)startTaskGroup
{
  if (-[CalDAVGetGrantedDelegatesTaskGroup fetchPrincipalDetails](self, "fetchPrincipalDetails")
    && -[CalDAVGetDelegatesBaseTaskGroup serverSupportsExpandPropertyReport](self, "serverSupportsExpandPropertyReport"))
  {
    -[CalDAVGetGrantedDelegatesTaskGroup setState:](self, "setState:", 1);
    -[CalDAVGetGrantedDelegatesTaskGroup _expandPropertiesWithAllowWrite:](self, "_expandPropertiesWithAllowWrite:", 1);
  }
  else
  {
    -[CalDAVGetGrantedDelegatesTaskGroup _fetchOnlyHrefs](self, "_fetchOnlyHrefs");
  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  CalDAVGetGrantedDelegatesTaskGroup *v10;
  id v11;
  uint64_t v12;
  CalDAVGetGrantedDelegatesTaskGroup *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  CalDAVPrincipalEmailDetailsResult *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[CalDAVGetGrantedDelegatesTaskGroup state](self, "state");
  if (v8 == 1 || -[CalDAVGetGrantedDelegatesTaskGroup state](self, "state") == 2)
  {
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v6, "getTotalFailureError");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v6, "successfulValueForNameSpace:elementName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE60]);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        -[CalDAVGetDelegatesBaseTaskGroup _processDetailsFromMultiStatus:allowWrite:](self, "_processDetailsFromMultiStatus:allowWrite:", v9, v8 == 1);
        v10 = self;
        if (v8 == 1)
        {
          -[CalDAVGetGrantedDelegatesTaskGroup setState:](self, "setState:", 2);
          -[CalDAVGetGrantedDelegatesTaskGroup _expandPropertiesWithAllowWrite:](self, "_expandPropertiesWithAllowWrite:", 0);
          goto LABEL_8;
        }
        v11 = 0;
        v12 = 10;
LABEL_7:
        -[CalDAVGetGrantedDelegatesTaskGroup _finishWithError:state:](v10, "_finishWithError:state:", v11, v12);
LABEL_8:

        goto LABEL_14;
      }
    }
    v10 = self;
    v11 = v9;
    v12 = 6;
    goto LABEL_7;
  }
  if (-[CalDAVGetGrantedDelegatesTaskGroup state](self, "state") != 3)
  {
    v13 = self;
    v14 = v7;
    v15 = 9;
    goto LABEL_13;
  }
  if (v7)
  {
    v13 = self;
    v14 = v7;
    v15 = 7;
LABEL_13:
    -[CalDAVGetGrantedDelegatesTaskGroup _finishWithError:state:](v13, "_finishWithError:state:", v14, v15);
    goto LABEL_14;
  }
  v39 = v6;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v6, "multiStatus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "responses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v18;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v54;
    v41 = *MEMORY[0x24BE1AE30];
    v40 = *MEMORY[0x24BE1AE60];
    v42 = *(_QWORD *)v54;
    do
    {
      v22 = 0;
      v43 = v20;
      do
      {
        if (*(_QWORD *)v54 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v22);
        if ((objc_msgSend(v23, "hasPropertyError") & 1) == 0)
        {
          objc_msgSend(v23, "firstHref");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "payloadAsFullURL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "CDVRawPath");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = objc_msgSend(v26, "hasSuffix:", CFSTR("calendar-proxy-read/"));
          if ((v27 & 1) != 0 || objc_msgSend(v26, "hasSuffix:", CFSTR("calendar-proxy-write/")))
          {
            objc_msgSend(v23, "successfulPropertiesToValues");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "CDVObjectForKeyWithNameSpace:andName:", v41, v40);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v26;
            v48 = v22;
            v46 = v28;
            if (v27)
            {
              -[CalDAVGetDelegatesBaseTaskGroup readPrincipalURLs](self, "readPrincipalURLs");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[CalDAVGetDelegatesBaseTaskGroup readDetails](self, "readDetails");
            }
            else
            {
              -[CalDAVGetDelegatesBaseTaskGroup writePrincipalURLs](self, "writePrincipalURLs");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[CalDAVGetDelegatesBaseTaskGroup writeDetails](self, "writeDetails");
            }
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            v45 = v29;
            objc_msgSend(v29, "hrefs");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v50;
              do
              {
                for (i = 0; i != v34; ++i)
                {
                  if (*(_QWORD *)v50 != v35)
                    objc_enumerationMutation(v32);
                  objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "payloadAsFullURL");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (-[CalDAVGetGrantedDelegatesTaskGroup fetchPrincipalDetails](self, "fetchPrincipalDetails"))
                  {
                    objc_msgSend(v30, "addObject:", v37);
                  }
                  else
                  {
                    v38 = objc_alloc_init(CalDAVPrincipalEmailDetailsResult);
                    -[CalDAVPrincipalEmailDetailsResult setPrincipalURL:](v38, "setPrincipalURL:", v37);
                    objc_msgSend(v31, "addObject:", v38);

                  }
                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
              }
              while (v34);
            }

            v21 = v42;
            v20 = v43;
            v26 = v47;
            v22 = v48;
          }

        }
        ++v22;
      }
      while (v22 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v20);
  }

  -[CalDAVGetGrantedDelegatesTaskGroup _getChildProperties](self, "_getChildProperties");
  v7 = 0;
  v6 = v39;
LABEL_14:
  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObject:", v6);

}

- (void)taskGroup:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[CalDAVGetGrantedDelegatesTaskGroup state](self, "state");
  if (v8 == 5 || -[CalDAVGetGrantedDelegatesTaskGroup state](self, "state") == 4)
  {
    v9 = v6;
    v10 = v9;
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logHandleForAccountInfoProvider:", 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v15 = 138412290;
        v16 = v7;
        _os_log_impl(&dword_2096EB000, v13, OS_LOG_TYPE_DEBUG, "Ignoring error fetching delegate details, error: [%@]", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v9, "principalResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
LABEL_14:
        -[CalDAVGetGrantedDelegatesTaskGroup _getChildProperties](self, "_getChildProperties");

        goto LABEL_15;
      }
      if (v8 == 5)
        -[CalDAVGetDelegatesBaseTaskGroup writeDetails](self, "writeDetails");
      else
        -[CalDAVGetDelegatesBaseTaskGroup readDetails](self, "readDetails");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "principalResult");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);
    }

    goto LABEL_14;
  }
  -[CalDAVGetGrantedDelegatesTaskGroup _finishWithError:state:](self, "_finishWithError:state:", v7, 9);
LABEL_15:

}

- (BOOL)fetchPrincipalDetails
{
  return self->_fetchPrincipalDetails;
}

- (void)setFetchPrincipalDetails:(BOOL)a3
{
  self->_fetchPrincipalDetails = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

@end
