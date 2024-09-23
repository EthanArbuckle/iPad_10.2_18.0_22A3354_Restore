@implementation HDUserNotification

- (void)presentWithResponseHandler:(id)a3
{
  void (**v5)(id, HDUserNotification *, uint64_t, _QWORD);
  void *v6;
  id responseHandler;
  void *v8;
  void *v9;
  NSString *title;
  NSString *message;
  NSString *defaultButton;
  NSString *cancelButton;
  NSString *otherButton;
  int64_t v15;
  uint64_t v16;
  __CFUserNotification *v17;
  void *v18;
  id v19;
  void *v20;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Main;
  void *v23;
  SInt32 error;

  v5 = (void (**)(id, HDUserNotification *, uint64_t, _QWORD))a3;
  if (self->_responseHandler)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDUserNotification.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_responseHandler"));

  }
  v6 = (void *)MEMORY[0x212BD3780](v5);
  responseHandler = self->_responseHandler;
  self->_responseHandler = v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_additionalDescriptors)
    objc_msgSend(v8, "addEntriesFromDictionary:");
  title = self->_title;
  if (title)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", title, *MEMORY[0x24BDBD6D8]);
  message = self->_message;
  if (message)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", message, *MEMORY[0x24BDBD6E0]);
  defaultButton = self->_defaultButton;
  if (defaultButton)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", defaultButton, *MEMORY[0x24BDBD6F8]);
  cancelButton = self->_cancelButton;
  if (cancelButton)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", cancelButton, *MEMORY[0x24BDBD6F0]);
  otherButton = self->_otherButton;
  if (otherButton)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", otherButton, *MEMORY[0x24BDBD718]);
  v15 = -[HDUserNotification alertLevel](self, "alertLevel");
  if ((unint64_t)(v15 - 1) >= 3)
    v16 = 3;
  else
    v16 = 3 - v15;
  error = 0;
  v17 = CFUserNotificationCreate(0, 0.0, -[HDUserNotification userNotificationOptions](self, "userNotificationOptions") | v16, &error, (CFDictionaryRef)v9);
  self->_notification = v17;
  if (!v17)
    v5[2](v5, self, 1, 0);
  os_unfair_lock_lock((os_unfair_lock_t)&_pendingNotificationsLock);
  v18 = (void *)_pendingNotifications;
  if (!_pendingNotifications)
  {
    v19 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v20 = (void *)_pendingNotifications;
    _pendingNotifications = (uint64_t)v19;

    v18 = (void *)_pendingNotifications;
  }
  objc_msgSend(v18, "addObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&_pendingNotificationsLock);
  RunLoopSource = CFUserNotificationCreateRunLoopSource(0, self->_notification, (CFUserNotificationCallBack)_HDCFNotificationCallback, 0);
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  CFRelease(RunLoopSource);

}

- (void)_handleResponse:(unint64_t)a3
{
  id responseHandler;

  (*((void (**)(void))self->_responseHandler + 2))();
  responseHandler = self->_responseHandler;
  self->_responseHandler = 0;

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)defaultButton
{
  return self->_defaultButton;
}

- (void)setDefaultButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)otherButton
{
  return self->_otherButton;
}

- (void)setOtherButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)additionalDescriptors
{
  return self->_additionalDescriptors;
}

- (void)setAdditionalDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)alertLevel
{
  return self->_alertLevel;
}

- (void)setAlertLevel:(int64_t)a3
{
  self->_alertLevel = a3;
}

- (unint64_t)userNotificationOptions
{
  return self->_userNotificationOptions;
}

- (void)setUserNotificationOptions:(unint64_t)a3
{
  self->_userNotificationOptions = a3;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (__CFUserNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(__CFUserNotification *)a3
{
  self->_notification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_additionalDescriptors, 0);
  objc_storeStrong((id *)&self->_otherButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_defaultButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
