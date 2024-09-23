@implementation MSAMNotificationInfo

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  void *v5;
  __CFRunLoop *v6;

  if (a3)
    CFRetain(a3);
  if (self->_runLoopSource)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFRunLoop *)objc_msgSend(v5, "getCFRunLoop");
    CFRunLoopRemoveSource(v6, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);

    CFRelease(self->_runLoopSource);
  }
  self->_runLoopSource = a3;
}

- (__CFUserNotification)userNotification
{
  return self->_userNotification;
}

- (void)setUserNotification:(__CFUserNotification *)a3
{
  __CFUserNotification *userNotification;

  if (a3)
    CFRetain(a3);
  userNotification = self->_userNotification;
  if (userNotification)
    CFRelease(userNotification);
  self->_userNotification = a3;
}

- (void)dealloc
{
  __CFUserNotification *userNotification;
  void *v4;
  __CFRunLoop *v5;
  objc_super v6;

  userNotification = self->_userNotification;
  if (userNotification)
    CFRelease(userNotification);
  if (self->_runLoopSource)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (__CFRunLoop *)objc_msgSend(v4, "getCFRunLoop");
    CFRunLoopRemoveSource(v5, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);

    CFRelease(self->_runLoopSource);
  }
  v6.receiver = self;
  v6.super_class = (Class)MSAMNotificationInfo;
  -[MSAMNotificationInfo dealloc](&v6, sel_dealloc);
}

- (MSAlertManager)owner
{
  return (MSAlertManager *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_personID, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_destroyWeak((id *)&self->_owner);
}

+ (id)info
{
  return objc_alloc_init((Class)a1);
}

@end
