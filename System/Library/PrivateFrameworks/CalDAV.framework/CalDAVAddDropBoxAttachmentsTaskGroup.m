@implementation CalDAVAddDropBoxAttachmentsTaskGroup

- (CalDAVAddDropBoxAttachmentsTaskGroup)initWithAccountInfoProvider:(id)a3 dropboxURL:(id)a4 attachments:(id)a5 contentTypes:(id)a6 attendeePrincipalURLs:(id)a7 attendeesCanManageDropBox:(BOOL)a8 taskManager:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  CalDAVAddDropBoxAttachmentsTaskGroup *v19;
  CalDAVAddDropBoxAttachmentsTaskGroup *v20;
  void *v21;
  objc_super v23;

  v9 = a8;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CalDAVAddDropBoxAttachmentsTaskGroup;
  v19 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v23, sel_initWithAccountInfoProvider_taskManager_, a3, a9);
  v20 = v19;
  if (v19)
  {
    -[CalDAVAddDropBoxAttachmentsTaskGroup setState:](v19, "setState:", 0);
    -[CalDAVAddDropBoxAttachmentsTaskGroup setAttendeesCanManageDropBox:](v20, "setAttendeesCanManageDropBox:", v9);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVAddDropBoxAttachmentsTaskGroup setSentAttachmentURLsToETags:](v20, "setSentAttachmentURLsToETags:", v21);

    -[CalDAVAddDropBoxAttachmentsTaskGroup setDropboxURL:](v20, "setDropboxURL:", v15);
    -[CalDAVAddDropBoxAttachmentsTaskGroup setAttachments:](v20, "setAttachments:", v16);
    -[CalDAVAddDropBoxAttachmentsTaskGroup setContentTypes:](v20, "setContentTypes:", v17);
    -[CalDAVAddDropBoxAttachmentsTaskGroup setAttendeePrincipalURLs:](v20, "setAttendeePrincipalURLs:", v18);
    -[CalDAVAddDropBoxAttachmentsTaskGroup setAceItems:](v20, "setAceItems:", 0);
  }

  return v20;
}

- (NSDictionary)etags
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CalDAVAddDropBoxAttachmentsTaskGroup sentAttachmentURLsToETags](self, "sentAttachmentURLsToETags", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[CalDAVAddDropBoxAttachmentsTaskGroup sentAttachmentURLsToETags](self, "sentAttachmentURLsToETags");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 != v12)
          objc_msgSend(v3, "setObject:forKey:", v11, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
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
  -[CalDAVAddDropBoxAttachmentsTaskGroup setState:](self, "setState:", v4);
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

- (void)_updateACLWithState:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[CalDAVAddDropBoxAttachmentsTaskGroup setState:](self, "setState:", *(_QWORD *)&a3);
  -[CalDAVAddDropBoxAttachmentsTaskGroup aceItems](self, "aceItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[CalDAVAddDropBoxAttachmentsTaskGroup attendeePrincipalURLs](self, "attendeePrincipalURLs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVAddDropBoxAttachmentsTaskGroup dropboxURL](self, "dropboxURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalDAVAddDropBoxAttachmentsTaskGroup dropboxACEItemsForPrincipalURLs:baseURL:writable:](CalDAVAddDropBoxAttachmentsTaskGroup, "dropboxACEItemsForPrincipalURLs:baseURL:writable:", v5, v6, -[CalDAVAddDropBoxAttachmentsTaskGroup attendeesCanManageDropBox](self, "attendeesCanManageDropBox"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVAddDropBoxAttachmentsTaskGroup setAceItems:](self, "setAceItems:", v7);

  }
  v8 = objc_alloc(MEMORY[0x24BE1ABD0]);
  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVAddDropBoxAttachmentsTaskGroup aceItems](self, "aceItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVAddDropBoxAttachmentsTaskGroup dropboxURL](self, "dropboxURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithAccountInfoProvider:aceItems:url:taskManager:", v9, v10, v11, v12);
  -[CalDAVAddDropBoxAttachmentsTaskGroup setUpdateACLTaskGroup:](self, "setUpdateACLTaskGroup:", v13);

  -[CalDAVAddDropBoxAttachmentsTaskGroup updateACLTaskGroup](self, "updateACLTaskGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);

  -[CalDAVAddDropBoxAttachmentsTaskGroup updateACLTaskGroup](self, "updateACLTaskGroup");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startTaskGroup");

}

- (void)_makeDropBox
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CalDAVAddDropBoxAttachmentsTaskGroup setState:](self, "setState:", 3);
  v3 = objc_alloc(MEMORY[0x24BE1AB58]);
  -[CalDAVAddDropBoxAttachmentsTaskGroup dropboxURL](self, "dropboxURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "initWithPropertiesToSet:atURL:", 0, v4);

  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccountInfoProvider:", v5);

  objc_msgSend(v7, "setDelegate:", self);
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitQueuedCoreDAVTask:", v7);

}

- (void)_sendAttachments
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[CalDAVAddDropBoxAttachmentsTaskGroup attachments](self, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[CalDAVAddDropBoxAttachmentsTaskGroup sentAttachmentURLsToETags](self, "sentAttachmentURLsToETags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 <= v6)
  {
    -[CalDAVAddDropBoxAttachmentsTaskGroup _finishWithError:state:](self, "_finishWithError:state:", 0, 11);
  }
  else
  {
    -[CalDAVAddDropBoxAttachmentsTaskGroup setState:](self, "setState:", 5);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[CalDAVAddDropBoxAttachmentsTaskGroup attachments](self, "attachments", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[CalDAVAddDropBoxAttachmentsTaskGroup sentAttachmentURLsToETags](self, "sentAttachmentURLsToETags");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            -[CalDAVAddDropBoxAttachmentsTaskGroup contentTypes](self, "contentTypes");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKey:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v16, "length"))
            {
              -[CalDAVAddDropBoxAttachmentsTaskGroup attachments](self, "attachments");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKey:", v12);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1ABB8]), "initWithDataPayload:dataContentType:atURL:previousETag:", v18, v16, v12, 0);
              objc_msgSend(v19, "setForceToServer:", 1);
              -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setAccountInfoProvider:", v20);

              objc_msgSend(v19, "setDelegate:", self);
              -[CoreDAVTaskGroup taskManager](self, "taskManager");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "submitQueuedCoreDAVTask:", v19);

            }
            else
            {
              -[CalDAVAddDropBoxAttachmentsTaskGroup _finishWithError:state:](self, "_finishWithError:state:", 0, 8);
            }

            goto LABEL_16;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_16:

  }
}

- (void)startTaskGroup
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CalDAVAddDropBoxAttachmentsTaskGroup attendeePrincipalURLs](self, "attendeePrincipalURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CalDAVAddDropBoxAttachmentsTaskGroup _updateACLWithState:](self, "_updateACLWithState:", 1);
  }
  else
  {
    -[CalDAVAddDropBoxAttachmentsTaskGroup setState:](self, "setState:", 2);
    v5 = objc_alloc(MEMORY[0x24BE1AB08]);
    -[CalDAVAddDropBoxAttachmentsTaskGroup dropboxURL](self, "dropboxURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v5, "initWithURL:", v6);

    -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccountInfoProvider:", v7);

    objc_msgSend(v9, "setDelegate:", self);
    -[CoreDAVTaskGroup taskManager](self, "taskManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitQueuedCoreDAVTask:", v9);

  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  CalDAVAddDropBoxAttachmentsTaskGroup *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  if (-[CalDAVAddDropBoxAttachmentsTaskGroup state](self, "state") == 2)
  {
    if (v6)
    {
      -[CalDAVAddDropBoxAttachmentsTaskGroup _makeDropBox](self, "_makeDropBox");
      goto LABEL_20;
    }
LABEL_15:
    -[CalDAVAddDropBoxAttachmentsTaskGroup _sendAttachments](self, "_sendAttachments");
    goto LABEL_20;
  }
  if (-[CalDAVAddDropBoxAttachmentsTaskGroup state](self, "state") == 3)
  {
    if (!v6)
    {
      -[CalDAVAddDropBoxAttachmentsTaskGroup attendeePrincipalURLs](self, "attendeePrincipalURLs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19)
      {
        -[CalDAVAddDropBoxAttachmentsTaskGroup _updateACLWithState:](self, "_updateACLWithState:", 4);
        goto LABEL_20;
      }
      goto LABEL_15;
    }
    v7 = self;
    v8 = v6;
    v9 = 6;
LABEL_12:
    -[CalDAVAddDropBoxAttachmentsTaskGroup _finishWithError:state:](v7, "_finishWithError:state:", v8, v9);
    goto LABEL_20;
  }
  if (-[CalDAVAddDropBoxAttachmentsTaskGroup state](self, "state") != 5
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7 = self;
    v8 = v6;
    v9 = 10;
    goto LABEL_12;
  }
  v10 = v22;
  v11 = v10;
  if (v6)
  {
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v10, "requestDataPayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "length"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v11, "url");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryWithObject:forKey:", v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVAddDropBoxAttachmentsTaskGroup setPutFailureSizes:](self, "setPutFailureSizes:", v17);

    -[CalDAVAddDropBoxAttachmentsTaskGroup _finishWithError:state:](self, "_finishWithError:state:", v6, 9);
  }
  else
  {
    objc_msgSend(v10, "nextETag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CalDAVAddDropBoxAttachmentsTaskGroup sentAttachmentURLsToETags](self, "sentAttachmentURLsToETags");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "url");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v14, v21);

    -[CalDAVAddDropBoxAttachmentsTaskGroup _sendAttachments](self, "_sendAttachments");
  }

LABEL_20:
}

- (void)taskGroup:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  CalDAVAddDropBoxAttachmentsTaskGroup *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (-[CalDAVAddDropBoxAttachmentsTaskGroup state](self, "state") != 1)
  {
    if (-[CalDAVAddDropBoxAttachmentsTaskGroup state](self, "state") != 4)
    {
      v7 = self;
      v8 = v6;
      v9 = 10;
      goto LABEL_11;
    }
    if (v6)
    {
LABEL_8:
      v7 = self;
      v8 = v6;
      v9 = 7;
LABEL_11:
      -[CalDAVAddDropBoxAttachmentsTaskGroup _finishWithError:state:](v7, "_finishWithError:state:", v8, v9);
      goto LABEL_12;
    }
LABEL_9:
    -[CalDAVAddDropBoxAttachmentsTaskGroup _sendAttachments](self, "_sendAttachments");
    goto LABEL_12;
  }
  if (!v6)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v10, "state") != 5)
    goto LABEL_8;
  -[CalDAVAddDropBoxAttachmentsTaskGroup _makeDropBox](self, "_makeDropBox");
LABEL_12:
  -[CalDAVAddDropBoxAttachmentsTaskGroup setUpdateACLTaskGroup:](self, "setUpdateACLTaskGroup:", 0);

}

+ (id)dropboxACEItemsForPrincipalURLs:(id)a3 baseURL:(id)a4 writable:(BOOL)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  id obj;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE1AE30];
  objc_msgSend(MEMORY[0x24BE1AAC0], "privilegeItemWithNameSpace:andName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AF08]);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AAC0], "privilegeItemWithNameSpace:andName:", v7, *MEMORY[0x24BE1AF80]);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v9;
  v28 = (void *)v8;
  v31 = v10;
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v8, v9, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v10;
  }
  v12 = v11;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v14)
  {
    v15 = v14;
    v30 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB98]), "initTypeIsHREFWithURL:", v17);
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AAC0]), "initWithPrincipal:shouldInvert:action:withPrivileges:", v18, 0, 0, v12);
        objc_msgSend(v13, "addObject:", v19);

        objc_msgSend(v17, "CDVfixedURLByAppendingPathComponent:", CFSTR("calendar-proxy-read/"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB98]), "initTypeIsHREFWithURL:", v20);

        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AAC0]), "initWithPrincipal:shouldInvert:action:withPrivileges:", v21, 0, 0, v31);
        objc_msgSend(v13, "addObject:", v22);

        objc_msgSend(v17, "CDVfixedURLByAppendingPathComponent:", CFSTR("calendar-proxy-write/"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB98]), "initTypeIsHREFWithURL:", v23);

        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AAC0]), "initWithPrincipal:shouldInvert:action:withPrivileges:", v24, 0, 0, v12);
        objc_msgSend(v13, "addObject:", v25);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v15);
  }

  return v13;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSDictionary)putFailureSizes
{
  return self->_putFailureSizes;
}

- (void)setPutFailureSizes:(id)a3
{
  objc_storeStrong((id *)&self->_putFailureSizes, a3);
}

- (BOOL)attendeesCanManageDropBox
{
  return self->_attendeesCanManageDropBox;
}

- (void)setAttendeesCanManageDropBox:(BOOL)a3
{
  self->_attendeesCanManageDropBox = a3;
}

- (NSMutableDictionary)sentAttachmentURLsToETags
{
  return self->_sentAttachmentURLsToETags;
}

- (void)setSentAttachmentURLsToETags:(id)a3
{
  objc_storeStrong((id *)&self->_sentAttachmentURLsToETags, a3);
}

- (NSURL)dropboxURL
{
  return self->_dropboxURL;
}

- (void)setDropboxURL:(id)a3
{
  objc_storeStrong((id *)&self->_dropboxURL, a3);
}

- (NSDictionary)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (NSDictionary)contentTypes
{
  return self->_contentTypes;
}

- (void)setContentTypes:(id)a3
{
  objc_storeStrong((id *)&self->_contentTypes, a3);
}

- (NSSet)attendeePrincipalURLs
{
  return self->_attendeePrincipalURLs;
}

- (void)setAttendeePrincipalURLs:(id)a3
{
  objc_storeStrong((id *)&self->_attendeePrincipalURLs, a3);
}

- (NSSet)aceItems
{
  return self->_aceItems;
}

- (void)setAceItems:(id)a3
{
  objc_storeStrong((id *)&self->_aceItems, a3);
}

- (CoreDAVUpdateACLTaskGroup)updateACLTaskGroup
{
  return self->_updateACLTaskGroup;
}

- (void)setUpdateACLTaskGroup:(id)a3
{
  objc_storeStrong((id *)&self->_updateACLTaskGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateACLTaskGroup, 0);
  objc_storeStrong((id *)&self->_aceItems, 0);
  objc_storeStrong((id *)&self->_attendeePrincipalURLs, 0);
  objc_storeStrong((id *)&self->_contentTypes, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_dropboxURL, 0);
  objc_storeStrong((id *)&self->_sentAttachmentURLsToETags, 0);
  objc_storeStrong((id *)&self->_putFailureSizes, 0);
}

@end
