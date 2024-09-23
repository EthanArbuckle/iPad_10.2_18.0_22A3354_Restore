@implementation EMDaemonInterfaceRequest

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__EMDaemonInterfaceRequest_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken != -1)
    dispatch_once(&signpostLog_onceToken, block);
  return (OS_os_log *)(id)signpostLog_log;
}

+ (unint64_t)uniqueRequestID
{
  NSObject *v2;
  os_signpost_id_t v3;

  +[EMDaemonInterfaceRequest systemScopeSignpostLog](EMDaemonInterfaceRequest, "systemScopeSignpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  return v3;
}

+ (id)systemScopeSignpostLog
{
  if (systemScopeSignpostLog_onceToken != -1)
    dispatch_once(&systemScopeSignpostLog_onceToken, &__block_literal_global_445);
  return (id)systemScopeSignpostLog_log;
}

void __39__EMDaemonInterfaceRequest_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;

}

void __50__EMDaemonInterfaceRequest_systemScopeSignpostLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email.signposts", "EMRequestIDGenerationCategory");
  v1 = (void *)systemScopeSignpostLog_log;
  systemScopeSignpostLog_log = (uint64_t)v0;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

@end
