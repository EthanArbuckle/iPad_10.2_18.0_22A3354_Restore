@implementation VSUserNotificationOperation

- (VSUserNotificationOperation)init
{
  VSUserNotificationOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSUserNotificationOperation;
  result = -[VSUserNotificationOperation init](&v3, sel_init);
  if (result)
  {
    result->_userNotificationCreateProc = (void *)MEMORY[0x1E0C995A8];
    result->_userNotificationReceiveResponseProc = (void *)MEMORY[0x1E0C995E8];
    result->_userNotificationCancelProc = (void *)MEMORY[0x1E0C995A0];
  }
  return result;
}

- (void)main
{
  NSObject *v3;
  uint64_t v4;
  __CFDictionary *Mutable;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;
  int v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[VSUserNotificationOperation main]";
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if ((-[VSUserNotificationOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v18 = 0;
    v4 = *MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    -[VSUserNotificationOperation iconURL](self, "iconURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C9B848], v6);
    -[VSUserNotificationOperation title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C9B800], v7);
    -[VSUserNotificationOperation message](self, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C9B810], v8);
    -[VSUserNotificationOperation defaultButtonTitle](self, "defaultButtonTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C9B838], v9);
    -[VSUserNotificationOperation alternateButtonTitle](self, "alternateButtonTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C9B830], v10);
    VSDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2419000, v11, OS_LOG_TYPE_DEFAULT, "Will present user notification", buf, 2u);
    }

    self->_notification = (__CFUserNotification *)((uint64_t (*)(uint64_t, _QWORD, int *, __CFDictionary *, double))-[VSUserNotificationOperation userNotificationCreateProc](self, "userNotificationCreateProc"))(v4, 0, &v18, Mutable, 0.0);
    VSDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2419000, v12, OS_LOG_TYPE_DEFAULT, "Did present user notification", buf, 2u);
    }

    CFRelease(Mutable);
    VSDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2419000, v13, OS_LOG_TYPE_DEFAULT, "Will wait to receive user notification response", buf, 2u);
    }

    v17 = 0;
    ((void (*)(__CFUserNotification *, unint64_t *, double))-[VSUserNotificationOperation userNotificationReceiveResponseProc](self, "userNotificationReceiveResponseProc"))(self->_notification, &v17, 0.0);
    VSDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2419000, v14, OS_LOG_TYPE_DEFAULT, "Did receive user notification response", buf, 2u);
    }

    if (v17 > 3)
      v15 = 0;
    else
      v15 = qword_1D24E8900[v17];
    -[VSUserNotificationOperation setResponse:](self, "setResponse:", v15);
    VSDefaultLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[VSUserNotificationOperation main]";
      _os_log_impl(&dword_1D2419000, v16, OS_LOG_TYPE_DEFAULT, "Will exit %s", buf, 0xCu);
    }

  }
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSUserNotificationOperation;
  -[VSUserNotificationOperation cancel](&v3, sel_cancel);
  ((void (*)(__CFUserNotification *))-[VSUserNotificationOperation userNotificationCancelProc](self, "userNotificationCancelProc"))(self->_notification);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (unint64_t)response
{
  return self->_response;
}

- (void)setResponse:(unint64_t)a3
{
  self->_response = a3;
}

- (void)userNotificationCreateProc
{
  return self->_userNotificationCreateProc;
}

- (void)setUserNotificationCreateProc:(void *)a3
{
  self->_userNotificationCreateProc = a3;
}

- (void)userNotificationReceiveResponseProc
{
  return self->_userNotificationReceiveResponseProc;
}

- (void)setUserNotificationReceiveResponseProc:(void *)a3
{
  self->_userNotificationReceiveResponseProc = a3;
}

- (void)userNotificationCancelProc
{
  return self->_userNotificationCancelProc;
}

- (void)setUserNotificationCancelProc:(void *)a3
{
  self->_userNotificationCancelProc = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
}

@end
