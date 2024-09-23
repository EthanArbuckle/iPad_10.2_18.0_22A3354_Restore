@implementation CalDAVGetDelegatesTaskGroup

- (CalDAVGetDelegatesTaskGroup)initWithAccountInfoProvider:(id)a3 principalURL:(id)a4 taskManager:(id)a5
{
  CalDAVGetDelegatesTaskGroup *v5;
  CalDAVGetDelegatesTaskGroup *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CalDAVGetDelegatesTaskGroup;
  v5 = -[CalDAVGetDelegatesBaseTaskGroup initWithAccountInfoProvider:principalURL:taskManager:](&v9, sel_initWithAccountInfoProvider_principalURL_taskManager_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[CalDAVGetDelegatesTaskGroup setState:](v5, "setState:", 0);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVGetDelegatesTaskGroup setNestedGroupPrincipalURLs:](v6, "setNestedGroupPrincipalURLs:", v7);

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
  -[CalDAVGetDelegatesTaskGroup setState:](self, "setState:", v4);
  if ((_DWORD)v4 == 10)
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

- (void)_expandProperties
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CalDAVGetDelegatesTaskGroup setState:](self, "setState:", 1);
  -[CalDAVGetDelegatesBaseTaskGroup _mappingsForPrincipalDetails](self, "_mappingsForPrincipalDetails");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BE1AAF8]);
  -[CalDAVGetDelegatesBaseTaskGroup principalURL](self, "principalURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE1ADC8];
  v6 = (void *)objc_msgSend(v3, "initWithPropertiesToFind:atURL:expandedName:expandedNameSpace:", v10, v4, CFSTR("calendar-proxy-read-for"), *MEMORY[0x24BE1ADC8]);

  objc_msgSend(v6, "addPropertyToExpandWithPropertiesToFind:expandedName:expandedNameSpace:", v10, CFSTR("calendar-proxy-write-for"), v5);
  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccountInfoProvider:", v8);

  objc_msgSend(v6, "setDelegate:", self);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitQueuedCoreDAVTask:", v6);

}

- (void)_getGroupMembershipForURL:(id)a3 state:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[CalDAVGetDelegatesTaskGroup setState:](self, "setState:", v4);
  v7 = objc_alloc(MEMORY[0x24BE1AB20]);
  v14 = (id)objc_msgSend(v7, "initWithNameSpace:name:parseClass:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE68], objc_opt_class());
  v8 = objc_alloc(MEMORY[0x24BE1ABA0]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithPropertiesToFind:atURL:withDepth:", v9, v6, 2);

  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v10);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccountInfoProvider:", v12);

  objc_msgSend(v10, "setDelegate:", self);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitQueuedCoreDAVTask:", v10);

}

- (void)_getChildProperties
{
  void *v3;
  void *v4;
  CalDAVGetDelegatesTaskGroup *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[CalDAVGetDelegatesTaskGroup nestedGroupPrincipalURLs](self, "nestedGroupPrincipalURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVGetDelegatesBaseTaskGroup _popFromArray:](self, "_popFromArray:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CalDAVGetDelegatesTaskGroup _getGroupMembershipForURL:state:](self, "_getGroupMembershipForURL:state:", v8, 3);
LABEL_8:

    return;
  }
  -[CalDAVGetDelegatesBaseTaskGroup readPrincipalURLs](self, "readPrincipalURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVGetDelegatesBaseTaskGroup _popFromArray:](self, "_popFromArray:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v5 = self;
    v6 = 4;
LABEL_7:
    -[CalDAVGetDelegatesTaskGroup setState:](v5, "setState:", v6);
    -[CalDAVGetDelegatesBaseTaskGroup _getPrincipalDetailsForURL:](self, "_getPrincipalDetailsForURL:", v8);
    goto LABEL_8;
  }
  -[CalDAVGetDelegatesBaseTaskGroup writePrincipalURLs](self, "writePrincipalURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVGetDelegatesBaseTaskGroup _popFromArray:](self, "_popFromArray:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v5 = self;
    v6 = 5;
    goto LABEL_7;
  }
  -[CalDAVGetDelegatesTaskGroup _finishWithError:state:](self, "_finishWithError:state:", 0, 11);
}

- (void)startTaskGroup
{
  id v3;

  if (-[CalDAVGetDelegatesBaseTaskGroup serverSupportsExpandPropertyReport](self, "serverSupportsExpandPropertyReport"))
  {
    -[CalDAVGetDelegatesTaskGroup _expandProperties](self, "_expandProperties");
  }
  else
  {
    -[CalDAVGetDelegatesBaseTaskGroup principalURL](self, "principalURL");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[CalDAVGetDelegatesTaskGroup _getGroupMembershipForURL:state:](self, "_getGroupMembershipForURL:state:", v3, 2);

  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  CalDAVGetDelegatesTaskGroup *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (v7)
  {
    v10 = v7;
  }
  else
  {
    objc_msgSend(v8, "getTotalFailureError");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (-[CalDAVGetDelegatesTaskGroup state](self, "state") != 1)
  {
    if (-[CalDAVGetDelegatesTaskGroup state](self, "state") == 2)
    {
      if (v11)
      {
        v12 = self;
        v13 = v11;
        v14 = 7;
        goto LABEL_18;
      }
      v47 = v7;
      v46 = v9;
      objc_msgSend(v9, "successfulValueForNameSpace:elementName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE68]);
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "hrefs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      if (!v23)
        goto LABEL_37;
      v24 = v23;
      v25 = *(_QWORD *)v55;
LABEL_22:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v55 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v26);
        objc_msgSend(v27, "payloadAsFullURL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (!v28)
        {
          objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "logHandleForAccountInfoProvider:", 0);
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if (v32 && os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v27;
            _os_log_impl(&dword_2096EB000, v33, OS_LOG_TYPE_ERROR, "Got a nil URL for delegate group membership with href = %@", buf, 0xCu);
          }
          goto LABEL_35;
        }
        objc_msgSend(v28, "CDVRawPath");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "hasSuffix:", CFSTR("calendar-proxy-read/")))
        {
          -[CalDAVGetDelegatesBaseTaskGroup readPrincipalURLs](self, "readPrincipalURLs");
          v31 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v30, "hasSuffix:", CFSTR("calendar-proxy-write/")))
          {
            -[CalDAVGetDelegatesTaskGroup nestedGroupPrincipalURLs](self, "nestedGroupPrincipalURLs");
            v33 = objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v33, "addObject:", v29);
            goto LABEL_35;
          }
          -[CalDAVGetDelegatesBaseTaskGroup writePrincipalURLs](self, "writePrincipalURLs");
          v31 = objc_claimAutoreleasedReturnValue();
        }
        v33 = v31;
        objc_msgSend(v29, "CDVURLByDeletingLastPathComponent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v33, "addObject:", v34);

LABEL_35:
        if (v24 == ++v26)
        {
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
          if (!v24)
          {
LABEL_37:

            -[CalDAVGetDelegatesTaskGroup _getChildProperties](self, "_getChildProperties");
            v35 = v45;
            goto LABEL_51;
          }
          goto LABEL_22;
        }
      }
    }
    if (-[CalDAVGetDelegatesTaskGroup state](self, "state") != 3)
    {
      v12 = self;
      v13 = v11;
      v14 = 10;
      goto LABEL_18;
    }
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logHandleForAccountInfoProvider:", 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v11;
        _os_log_impl(&dword_2096EB000, v17, OS_LOG_TYPE_DEBUG, "Ignoring error fetching nested group, error: [%@]", buf, 0xCu);
      }

      -[CalDAVGetDelegatesTaskGroup _getChildProperties](self, "_getChildProperties");
      goto LABEL_19;
    }
    v47 = v7;
    v46 = v9;
    objc_msgSend(v9, "successfulValueForNameSpace:elementName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE68]);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "hrefs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (!v36)
    {
LABEL_50:

      -[CalDAVGetDelegatesTaskGroup _getChildProperties](self, "_getChildProperties");
      v35 = v48;
LABEL_51:

      v9 = v46;
      v7 = v47;
      v11 = 0;
      goto LABEL_19;
    }
    v37 = v36;
    v38 = *(_QWORD *)v51;
LABEL_40:
    v39 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v38)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v39), "payloadAsFullURL");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "CDVRawPath");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "hasSuffix:", CFSTR("calendar-proxy-read/")))
        break;
      if (objc_msgSend(v41, "hasSuffix:", CFSTR("calendar-proxy-write/")))
      {
        -[CalDAVGetDelegatesBaseTaskGroup writePrincipalURLs](self, "writePrincipalURLs");
        v42 = objc_claimAutoreleasedReturnValue();
        goto LABEL_47;
      }
LABEL_48:

      if (v37 == ++v39)
      {
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (!v37)
          goto LABEL_50;
        goto LABEL_40;
      }
    }
    -[CalDAVGetDelegatesBaseTaskGroup readPrincipalURLs](self, "readPrincipalURLs");
    v42 = objc_claimAutoreleasedReturnValue();
LABEL_47:
    v43 = (void *)v42;
    objc_msgSend(v40, "CDVURLByDeletingLastPathComponent");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v44);

    goto LABEL_48;
  }
  if (v11)
  {
    v12 = self;
    v13 = v11;
    v14 = 6;
LABEL_18:
    -[CalDAVGetDelegatesTaskGroup _finishWithError:state:](v12, "_finishWithError:state:", v13, v14);
    goto LABEL_19;
  }
  v18 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(v9, "successfulValueForNameSpace:elementName:", *MEMORY[0x24BE1ADC8], CFSTR("calendar-proxy-write-for"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVGetDelegatesBaseTaskGroup _processDetailsFromMultiStatus:allowWrite:](self, "_processDetailsFromMultiStatus:allowWrite:", v19, 1);
  objc_msgSend(v9, "successfulValueForNameSpace:elementName:", v18, CFSTR("calendar-proxy-read-for"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[CalDAVGetDelegatesBaseTaskGroup _processDetailsFromMultiStatus:allowWrite:](self, "_processDetailsFromMultiStatus:allowWrite:", v20, 0);
  -[CalDAVGetDelegatesTaskGroup _finishWithError:state:](self, "_finishWithError:state:", 0, 11);

LABEL_19:
  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeObject:", v9);

}

- (void)taskGroup:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  int v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = -[CalDAVGetDelegatesTaskGroup state](self, "state");
  if (!v6 && ((v8 = v7, -[CalDAVGetDelegatesTaskGroup state](self, "state") == 4) || v8 == 5))
  {
    v9 = v13;
    objc_msgSend(v9, "principalResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v8 == 5)
        -[CalDAVGetDelegatesBaseTaskGroup writeDetails](self, "writeDetails");
      else
        -[CalDAVGetDelegatesBaseTaskGroup readDetails](self, "readDetails");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "principalResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

    }
    -[CalDAVGetDelegatesTaskGroup _getChildProperties](self, "_getChildProperties");

  }
  else
  {
    -[CalDAVGetDelegatesTaskGroup _finishWithError:state:](self, "_finishWithError:state:", v6, 10);
  }

}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSMutableArray)nestedGroupPrincipalURLs
{
  return self->_nestedGroupPrincipalURLs;
}

- (void)setNestedGroupPrincipalURLs:(id)a3
{
  objc_storeStrong((id *)&self->_nestedGroupPrincipalURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nestedGroupPrincipalURLs, 0);
}

@end
