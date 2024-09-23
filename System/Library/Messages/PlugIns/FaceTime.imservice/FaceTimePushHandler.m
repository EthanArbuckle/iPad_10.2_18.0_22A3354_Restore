@implementation FaceTimePushHandler

- (void)setRegistered:(BOOL)a3
{
  if (a3)
    MEMORY[0x24BEDD108](self, sel__acceptIncomingPushes);
  else
    MEMORY[0x24BEDD108](self, sel__ignoreIncomingPushes);
}

- (void)_ignoreIncomingPushes
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (self->_registeredForPush)
  {
    self->_registeredForPush = 0;
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_229238000, v3, OS_LOG_TYPE_INFO, "No longer accepting incoming pushes", v5, 2u);
      }
    }
    v4 = (void *)MEMORY[0x22E2C6378]();
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BE4FC98], "sharedInstance"), "removeListener:", self);
    self->_isListening = 0;
    objc_autoreleasePoolPop(v4);
  }
}

+ (id)commandToHandlerBlock
{
  if (qword_253E79940 != -1)
    dispatch_once(&qword_253E79940, &unk_24F1EAE20);
  return (id)qword_253E79938;
}

- (FaceTimePushHandler)initWithTopics:(id)a3
{
  FaceTimePushHandler *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FaceTimePushHandler;
  v4 = -[FaceTimePushHandler init](&v6, sel_init);
  if (v4)
    v4->_topics = (NSArray *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE4FC98], "sharedInstance"), "removeListener:", self);

  v3.receiver = self;
  v3.super_class = (Class)FaceTimePushHandler;
  -[FaceTimePushHandler dealloc](&v3, sel_dealloc);
}

- (NSData)pushToken
{
  if (self->_registeredForPush)
    return (NSData *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE4FC98], "sharedInstance"), "pushToken");
  else
    return 0;
}

- (void)_updateListenerIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (self->_registeredForPush)
  {
    v3 = (void *)MEMORY[0x22E2C6378]();
    v4 = -[FaceTimePushHandler _pushTopics](self, "_pushTopics");
    v5 = v4;
    if (self->_isListening || !objc_msgSend(v4, "count"))
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BE4FC98], "sharedInstance");
      if (objc_msgSend(v5, "count"))
        v7 = objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
      else
        v7 = objc_msgSend(MEMORY[0x24BDBCF20], "set");
      objc_msgSend(v6, "setTopics:forListener:", v7, self);
    }
    else
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BE4FC98], "sharedInstance");
      v9 = objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
      objc_msgSend(v8, "addListener:topics:commands:queue:", self, v9, objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "commandToHandlerBlock"), "allKeys")), MEMORY[0x24BDAC9B8]);
      self->_isListening = 1;
    }
    objc_autoreleasePoolPop(v3);
  }
}

- (void)_acceptIncomingPushes
{
  NSObject *v3;
  uint8_t v4[16];

  if (!self->_registeredForPush)
  {
    self->_registeredForPush = 1;
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_229238000, v3, OS_LOG_TYPE_INFO, "Accepting incoming pushes", v4, 2u);
      }
    }
    -[FaceTimePushHandler _updateListenerIfNeeded](self, "_updateListenerIfNeeded");
  }
}

- (BOOL)registered
{
  return self->_registeredForPush;
}

- (void)configureAsMacNotificationCenterObserver:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE4FC98], "sharedInstance"), "configureAsMacNotificationCenterObserver:", a3);
}

- (id)_pushTopics
{
  return self->_topics;
}

- (id)copyHandlersForEnumerating
{
  return (id)MEMORY[0x24BEDD108](self->_handlers, sel__copyForEnumerating);
}

- (void)addListener:(id)a3
{
  NSMutableArray *handlers;

  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      handlers = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x24BDBCEB8], "nonRetainingArray");
      self->_handlers = handlers;
    }
    -[NSMutableArray addObject:](handlers, "addObject:", a3);
  }
}

- (void)removeListener:(id)a3
{
  -[NSMutableArray removeObjectIdenticalTo:](self->_handlers, "removeObjectIdenticalTo:", a3);
  if (!-[NSMutableArray count](self->_handlers, "count"))
  {

    self->_handlers = 0;
  }
}

- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = objc_msgSend(a4, "objectForKey:", CFSTR("c"));
  if (v10)
  {
    v11 = v10;
    v12 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:inDomain:", CFSTR("LDMGlobalEnabled"), *MEMORY[0x24BDD0D70]), "BOOLValue"))
    {
      v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = a4;
        _os_log_impl(&dword_229238000, v13, OS_LOG_TYPE_DEFAULT, "dropping push message: %@ for IMAV because lockdown mode is enabled", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }
    }
    else
    {
      v14 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "commandToHandlerBlock"), "objectForKey:", v11);
      if (v14)
        (*(void (**)(uint64_t, FaceTimePushHandler *, id, id))(v14 + 16))(v14, self, a5, a4);
    }
  }
}

@end
