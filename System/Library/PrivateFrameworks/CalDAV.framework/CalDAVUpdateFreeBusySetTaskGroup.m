@implementation CalDAVUpdateFreeBusySetTaskGroup

- (CalDAVUpdateFreeBusySetTaskGroup)initWithAccountInfoProvider:(id)a3 inboxURL:(id)a4 urlToAdd:(id)a5 suffixToFilterOut:(id)a6 taskManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  CalDAVUpdateFreeBusySetTaskGroup *v15;
  CalDAVUpdateFreeBusySetTaskGroup *v16;
  objc_super v18;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CalDAVUpdateFreeBusySetTaskGroup;
  v15 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v18, sel_initWithAccountInfoProvider_taskManager_, a3, a7);
  v16 = v15;
  if (v15)
  {
    -[CalDAVUpdateFreeBusySetTaskGroup setState:](v15, "setState:", 0);
    -[CalDAVUpdateFreeBusySetTaskGroup setInboxURL:](v16, "setInboxURL:", v12);
    -[CalDAVUpdateFreeBusySetTaskGroup setUrlToAdd:](v16, "setUrlToAdd:", v13);
    -[CalDAVUpdateFreeBusySetTaskGroup setSuffixToFilterOut:](v16, "setSuffixToFilterOut:", v14);
    -[CalDAVUpdateFreeBusySetTaskGroup setFetchTask:](v16, "setFetchTask:", 0);
  }

  return v16;
}

- (void)_startFetchFreeBusySet
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = objc_alloc(MEMORY[0x24BE1AB20]);
  v15 = (id)objc_msgSend(v3, "initWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AD20], objc_opt_class());
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", v15, 0);
  v5 = objc_alloc(MEMORY[0x24BE1ABA0]);
  -[CalDAVUpdateFreeBusySetTaskGroup inboxURL](self, "inboxURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPropertiesToFind:atURL:withDepth:", v4, v6, 2);

  -[CalDAVUpdateFreeBusySetTaskGroup setFetchTask:](self, "setFetchTask:", v7);
  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateFreeBusySetTaskGroup fetchTask](self, "fetchTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateFreeBusySetTaskGroup fetchTask](self, "fetchTask");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccountInfoProvider:", v10);

  -[CalDAVUpdateFreeBusySetTaskGroup fetchTask](self, "fetchTask");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateFreeBusySetTaskGroup fetchTask](self, "fetchTask");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitQueuedCoreDAVTask:", v14);

  -[CalDAVUpdateFreeBusySetTaskGroup setState:](self, "setState:", 1);
}

- (void)_startPropPatchWithURLs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE1AB18]);
  v6 = (void *)objc_msgSend(v5, "initWithNameSpace:andName:", *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AD20]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        v13 = objc_alloc_init(MEMORY[0x24BE1AB10]);
        objc_msgSend(v12, "CDVRawPath", (_QWORD)v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPayloadAsString:", v14);

        objc_msgSend(v6, "extraChildItems");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  v16 = objc_alloc(MEMORY[0x24BE1ABA8]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateFreeBusySetTaskGroup inboxURL](self, "inboxURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithPropertiesToSet:andRemove:atURL:", v17, 0, v18);

  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v19);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccountInfoProvider:", v21);

  objc_msgSend(v19, "setDelegate:", self);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "submitQueuedCoreDAVTask:", v19);

  -[CalDAVUpdateFreeBusySetTaskGroup setState:](self, "setState:", 2);
}

- (void)_finishWithError:(id)a3 state:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[CalDAVUpdateFreeBusySetTaskGroup setState:](self, "setState:", v4);
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v6, 0);

}

- (void)propFindTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;

  v29 = a5;
  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVUpdateFreeBusySetTaskGroup fetchTask](self, "fetchTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v7);

  if (!v29)
    goto LABEL_4;
  objc_msgSend(v29, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE1AA68]) & 1) == 0)
  {

    v10 = v29;
    goto LABEL_8;
  }
  v9 = objc_msgSend(v29, "code");

  v10 = v29;
  if (v9 != 2)
  {
LABEL_8:
    -[CalDAVUpdateFreeBusySetTaskGroup _finishWithError:state:](self, "_finishWithError:state:", v10, 4);
    goto LABEL_17;
  }
LABEL_4:
  -[CalDAVUpdateFreeBusySetTaskGroup fetchTask](self, "fetchTask");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "successfulValueForNameSpace:elementName:", *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AD20]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "hrefsAsFullURLs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

    -[CalDAVUpdateFreeBusySetTaskGroup suffixToFilterOut](self, "suffixToFilterOut");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      -[CalDAVUpdateFreeBusySetTaskGroup suffixToFilterOut](self, "suffixToFilterOut");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "CDVStringByAppendingSlashIfNeeded");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[CalDAVUpdateFreeBusySetTaskGroup suffixToFilterOut](self, "suffixToFilterOut");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "CDVStringByRemovingTerminatingSlashIfNeeded");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __71__CalDAVUpdateFreeBusySetTaskGroup_propFindTask_parsedResponses_error___block_invoke;
      v30[3] = &unk_24C1FB220;
      v31 = v20;
      v32 = v22;
      v23 = v22;
      v24 = v20;
      objc_msgSend(v16, "objectsPassingTest:", v30);
      v25 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v25;
    }
    -[CalDAVUpdateFreeBusySetTaskGroup urlToAdd](self, "urlToAdd");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[CalDAVUpdateFreeBusySetTaskGroup urlToAdd](self, "urlToAdd");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setByAddingObject:", v27);
      v28 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v28;
    }
    -[CalDAVUpdateFreeBusySetTaskGroup _startPropPatchWithURLs:](self, "_startPropPatchWithURLs:", v16);

  }
  else
  {
    -[CalDAVUpdateFreeBusySetTaskGroup _finishWithError:state:](self, "_finishWithError:state:", 0, 4);
  }

LABEL_17:
}

uint64_t __71__CalDAVUpdateFreeBusySetTaskGroup_propFindTask_parsedResponses_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasSuffix:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "hasSuffix:", *(_QWORD *)(a1 + 40)) ^ 1;

  return v4;
}

- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a5;
  v7 = a3;
  -[CoreDAVTaskGroup outstandingTasks](self, "outstandingTasks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

  -[CalDAVUpdateFreeBusySetTaskGroup _finishWithError:state:](self, "_finishWithError:state:");
}

- (void)taskGroupWillCancelWithError:(id)a3
{
  -[CalDAVUpdateFreeBusySetTaskGroup _finishWithError:state:](self, "_finishWithError:state:", a3, 6);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSURL)inboxURL
{
  return self->_inboxURL;
}

- (void)setInboxURL:(id)a3
{
  objc_storeStrong((id *)&self->_inboxURL, a3);
}

- (NSURL)urlToAdd
{
  return self->_urlToAdd;
}

- (void)setUrlToAdd:(id)a3
{
  objc_storeStrong((id *)&self->_urlToAdd, a3);
}

- (NSString)suffixToFilterOut
{
  return self->_suffixToFilterOut;
}

- (void)setSuffixToFilterOut:(id)a3
{
  objc_storeStrong((id *)&self->_suffixToFilterOut, a3);
}

- (CoreDAVPropFindTask)fetchTask
{
  return self->_fetchTask;
}

- (void)setFetchTask:(id)a3
{
  objc_storeStrong((id *)&self->_fetchTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchTask, 0);
  objc_storeStrong((id *)&self->_suffixToFilterOut, 0);
  objc_storeStrong((id *)&self->_urlToAdd, 0);
  objc_storeStrong((id *)&self->_inboxURL, 0);
}

@end
