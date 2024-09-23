@implementation UNNotificationServiceExtension

- (UNNotificationServiceExtension)init
{
  UNNotificationServiceExtension *v2;
  objc_class *v3;
  objc_class *v4;
  Method InstanceMethod;
  Method v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UNNotificationServiceExtension;
  v2 = -[UNNotificationServiceExtension init](&v13, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v4, sel_beginRequestWithExtensionContext_);
    v6 = class_getInstanceMethod(v3, sel_beginRequestWithExtensionContext_);
    v7 = UNLogServiceExtension;
    if (InstanceMethod == v6)
    {
      if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AA8E4000, v7, OS_LOG_TYPE_DEFAULT, "Service extension was initialized", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_ERROR))
        -[UNNotificationServiceExtension init].cold.1();
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99750];
      NSStringFromClass(v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise:format:", v9, CFSTR("You have overridden beginRequestWithExtensionContext: on your subclass of UNNotificationServiceExtension (%@) - this is not allowed"), v10);

    }
  }
  return v2;
}

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void *)contentHandler
{
  UNNotificationRequest *v5;
  void (**v6)(void *, void *);
  void *v7;

  v5 = request;
  v6 = contentHandler;
  if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_ERROR))
    -[UNNotificationServiceExtension didReceiveNotificationRequest:withContentHandler:].cold.1();
  -[UNNotificationRequest content](v5, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (void)serviceExtensionTimeWillExpire
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA8E4000, v0, v1, "Service extension base class recieved serviceExtensionTimeWillExpire", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = objc_opt_class();
  UNSafeCast(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setExtensionInstance:", self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationServiceExtension.m"), 71, CFSTR("remoteContext is not an instance of _UNNotificationServiceExtensionRemoteContext: remoteContext='%@'"), 0);

    if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_ERROR))
      -[UNNotificationServiceExtension beginRequestWithExtensionContext:].cold.1();
    objc_msgSend(MEMORY[0x1E0CB35C8], "un_errorWithUNPrivateErrorCode:userInfo:", 1902, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelRequestWithError:", v10);

  }
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA8E4000, v0, v1, "Service extension was initialized but the developer is attempting to hijack beginRequestWithExtensionContext:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)didReceiveNotificationRequest:withContentHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA8E4000, v0, v1, "Service extension base class recieved didReceiveNotificationRequest:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)beginRequestWithExtensionContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AA8E4000, v0, v1, "Remote context is not an instance of _UNNotificationServiceExtensionRemoteContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
