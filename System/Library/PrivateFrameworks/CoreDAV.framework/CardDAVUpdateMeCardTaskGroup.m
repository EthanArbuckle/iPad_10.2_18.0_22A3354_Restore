@implementation CardDAVUpdateMeCardTaskGroup

- (CardDAVUpdateMeCardTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 homeURL:(id)a5 cardURL:(id)a6
{
  id v11;
  id v12;
  CardDAVUpdateMeCardTaskGroup *v13;
  CardDAVUpdateMeCardTaskGroup *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CardDAVUpdateMeCardTaskGroup;
  v13 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v16, sel_initWithAccountInfoProvider_taskManager_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_homeURL, a5);
    objc_storeStrong((id *)&v14->_cardURL, a6);
  }

  return v14;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: %@"), v5, self, self->_cardURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)_newPropPatchTask
{
  CoreDAVHrefItem *v3;
  CoreDAVItemWithHrefChildItem *v4;
  void *v5;
  CoreDAVPropPatchTask *v6;

  v3 = -[CoreDAVHrefItem initWithURL:]([CoreDAVHrefItem alloc], "initWithURL:", self->_cardURL);
  -[CoreDAVHrefItem setWriteStyle:](v3, "setWriteStyle:", 2);
  v4 = -[CoreDAVItem initWithNameSpace:andName:]([CoreDAVItemWithHrefChildItem alloc], "initWithNameSpace:andName:", CFSTR("http://calendarserver.org/ns/"), CFSTR("me-card"));
  -[CoreDAVItemWithHrefChildItem setHref:](v4, "setHref:", v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", v4, 0);
  v6 = -[CoreDAVPropPatchTask initWithPropertiesToSet:andRemove:atURL:]([CoreDAVPropPatchTask alloc], "initWithPropertiesToSet:andRemove:atURL:", v5, 0, self->_homeURL);

  return v6;
}

- (void)startTaskGroup
{
  id WeakRetained;
  id v4;
  id v5;

  v5 = -[CardDAVUpdateMeCardTaskGroup _newPropPatchTask](self, "_newPropPatchTask");
  objc_msgSend(v5, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  objc_msgSend(v5, "setAccountInfoProvider:", WeakRetained);

  objc_msgSend(v5, "setTimeoutInterval:", self->super._timeoutInterval);
  -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v5);
  v4 = objc_loadWeakRetained((id *)&self->super._taskManager);
  objc_msgSend(v4, "submitQueuedCoreDAVTask:", v5);

}

- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a5;
  if (-[NSMutableSet containsObject:](self->super._outstandingTasks, "containsObject:", v8))
  {
    -[NSMutableSet removeObject:](self->super._outstandingTasks, "removeObject:", v8);
    if (v7)
      -[CoreDAVTaskGroup bailWithError:](self, "bailWithError:", v7);
    else
      -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, 0);
  }

}

- (NSURL)cardURL
{
  return self->_cardURL;
}

- (NSURL)homeURL
{
  return self->_homeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardURL, 0);
  objc_storeStrong((id *)&self->_homeURL, 0);
}

@end
