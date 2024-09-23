@implementation CalDAVModifyCalendarSharingLevelTaskGroup

- (CalDAVModifyCalendarSharingLevelTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Initializing this class instance with an inherited initializer not allowed."), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (CalDAVModifyCalendarSharingLevelTaskGroup)initWithSharingAction:(int)a3 atCalendarURL:(id)a4 accountInfoProvider:(id)a5 taskManager:(id)a6
{
  uint64_t v8;
  id v10;
  CalDAVModifyCalendarSharingLevelTaskGroup *v11;
  CalDAVModifyCalendarSharingLevelTaskGroup *v12;
  objc_super v14;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CalDAVModifyCalendarSharingLevelTaskGroup;
  v11 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v14, sel_initWithAccountInfoProvider_taskManager_, a5, a6);
  v12 = v11;
  if (v11)
  {
    -[CalDAVModifyCalendarSharingLevelTaskGroup setAction:](v11, "setAction:", v8);
    -[CalDAVModifyCalendarSharingLevelTaskGroup setUrl:](v12, "setUrl:", v10);
    -[CalDAVModifyCalendarSharingLevelTaskGroup setState:](v12, "setState:", 0);
  }

  return v12;
}

- (void)startTaskGroup
{
  id v3;
  void *v4;
  __CFString **v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  switch(-[CalDAVModifyCalendarSharingLevelTaskGroup action](self, "action"))
  {
    case 0:
      v3 = objc_alloc_init(MEMORY[0x24BE1ABD8]);
      v4 = v3;
      v5 = cdXMLCalendarServerPublishCalendar;
      goto LABEL_4;
    case 1:
      v3 = objc_alloc_init(MEMORY[0x24BE1ABD8]);
      v4 = v3;
      v5 = cdXMLCalendarServerUnpublishCalendar;
LABEL_4:
      objc_msgSend(v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", *v5, *MEMORY[0x24BE1ADC8], 0, 0);
      v6 = objc_alloc(MEMORY[0x24BE1AB90]);
      objc_msgSend(v4, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVModifyCalendarSharingLevelTaskGroup url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v6, "initWithDataPayload:dataContentType:atURL:previousETag:", v7, CFSTR("text/xml"), v8, 0);
      v9 = 1;
      goto LABEL_7;
    case 2:
      v10 = objc_alloc(MEMORY[0x24BE1AB20]);
      v4 = (void *)objc_msgSend(v10, "initWithNameSpace:name:parseClass:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AF18], objc_opt_class());
      v11 = objc_alloc(MEMORY[0x24BE1ABA0]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVModifyCalendarSharingLevelTaskGroup url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 2;
      v16 = (id)objc_msgSend(v11, "initWithPropertiesToFind:atURL:withDepth:", v7, v8, 2);
      goto LABEL_7;
    case 3:
      v12 = objc_alloc(MEMORY[0x24BE1AB20]);
      v4 = (void *)objc_msgSend(v12, "initWithNameSpace:name:parseClass:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AF18], objc_opt_class());
      v13 = objc_alloc(MEMORY[0x24BE1ABA0]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVModifyCalendarSharingLevelTaskGroup url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v13, "initWithPropertiesToFind:atURL:withDepth:", v7, v8, 2);
      v9 = 3;
LABEL_7:

      -[CalDAVModifyCalendarSharingLevelTaskGroup setState:](self, "setState:", v9);
      if (v16)
      {
        -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAccountInfoProvider:", v14);

        objc_msgSend(v16, "setDelegate:", self);
        -[CoreDAVTaskGroup taskManager](self, "taskManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "submitQueuedCoreDAVTask:", v16);

      }
      break;
    default:
      return;
  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v6;
  CalDAVModifyCalendarSharingLevelTaskGroup *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v6 = a4;
  if (!v6)
  {
    switch(-[CalDAVModifyCalendarSharingLevelTaskGroup state](self, "state"))
    {
      case 1:
        v9 = objc_alloc(MEMORY[0x24BE1AB20]);
        v10 = (void *)objc_msgSend(v9, "initWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ADC8], *MEMORY[0x24BE1AD88], objc_opt_class());
        v11 = objc_alloc(MEMORY[0x24BE1ABA0]);
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalDAVModifyCalendarSharingLevelTaskGroup url](self, "url");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v11, "initWithPropertiesToFind:atURL:withDepth:", v12, v13, 2);

        -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAccountInfoProvider:", v15);

        objc_msgSend(v14, "setDelegate:", self);
        -[CalDAVModifyCalendarSharingLevelTaskGroup setState:](self, "setState:", 6);
        goto LABEL_13;
      case 2:
        objc_msgSend(v30, "successfulValueForNameSpace:elementName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AF18]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v16;
        if (!v16)
          goto LABEL_14;
        objc_msgSend(v16, "sharedOwner");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          goto LABEL_14;
        v18 = objc_alloc(MEMORY[0x24BE1AB40]);
        v19 = (void *)objc_msgSend(v18, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("shared-owner"));
        objc_msgSend(v10, "setSharedOwner:", v19);

        goto LABEL_12;
      case 3:
        objc_msgSend(v30, "successfulValueForNameSpace:elementName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AF18]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v20;
        if (v20
          && (objc_msgSend(v20, "sharedOwner"), v21 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v21,
                                                v21))
        {
          objc_msgSend(v10, "setSharedOwner:", 0);
LABEL_12:
          v22 = objc_alloc(MEMORY[0x24BE1ABA8]);
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v10, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[CalDAVModifyCalendarSharingLevelTaskGroup url](self, "url");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v22, "initWithPropertiesToSet:andRemove:atURL:", v23, 0, v24);

          -[CalDAVModifyCalendarSharingLevelTaskGroup setState:](self, "setState:", 4);
          -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setAccountInfoProvider:", v25);

          objc_msgSend(v14, "setDelegate:", self);
LABEL_13:
          -[CoreDAVTaskGroup taskManager](self, "taskManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "submitQueuedCoreDAVTask:", v14);

        }
        else
        {
LABEL_14:
          -[CalDAVModifyCalendarSharingLevelTaskGroup setState:](self, "setState:", 7);
          -[CalDAVModifyCalendarSharingLevelTaskGroup finishWithError:](self, "finishWithError:", 0);
        }

        goto LABEL_16;
      case 6:
        objc_msgSend(v30, "successfulValueForNameSpace:elementName:", *MEMORY[0x24BE1ADC8], *MEMORY[0x24BE1AD88]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "href");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "payloadAsFullURL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalDAVModifyCalendarSharingLevelTaskGroup setPublishedURL:](self, "setPublishedURL:", v29);

        goto LABEL_18;
      default:
LABEL_18:
        -[CalDAVModifyCalendarSharingLevelTaskGroup setState:](self, "setState:", 7);
        v7 = self;
        v8 = 0;
        goto LABEL_3;
    }
  }
  -[CalDAVModifyCalendarSharingLevelTaskGroup setState:](self, "setState:", 7);
  v7 = self;
  v8 = v6;
LABEL_3:
  -[CalDAVModifyCalendarSharingLevelTaskGroup finishWithError:](v7, "finishWithError:", v8);
LABEL_16:

}

- (void)finishWithError:(id)a3
{
  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", a3, 0);
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_action = a3;
}

- (NSURL)publishedURL
{
  return self->_publishedURL;
}

- (void)setPublishedURL:(id)a3
{
  objc_storeStrong((id *)&self->_publishedURL, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_publishedURL, 0);
}

@end
