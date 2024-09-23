@implementation FBKLog

+ (OS_os_log)upload
{
  if (upload_onceToken1 != -1)
    dispatch_once(&upload_onceToken1, &__block_literal_global_14);
  return (OS_os_log *)(id)upload_handle;
}

void __16__FBKLog_upload__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "upload");
  v1 = (void *)upload_handle;
  upload_handle = (uint64_t)v0;

}

+ (OS_os_log)model
{
  if (model_onceToken1 != -1)
    dispatch_once(&model_onceToken1, &__block_literal_global_6);
  return (OS_os_log *)(id)model_handle;
}

void __15__FBKLog_model__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "model");
  v1 = (void *)model_handle;
  model_handle = (uint64_t)v0;

}

+ (OS_os_log)ffu
{
  if (ffu_onceToken1 != -1)
    dispatch_once(&ffu_onceToken1, &__block_literal_global_8);
  return (OS_os_log *)(id)ffu_handle;
}

void __13__FBKLog_ffu__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "ffu");
  v1 = (void *)ffu_handle;
  ffu_handle = (uint64_t)v0;

}

+ (OS_os_log)clientHandle
{
  if (clientHandle_onceToken1 != -1)
    dispatch_once(&clientHandle_onceToken1, &__block_literal_global_10);
  return (OS_os_log *)(id)clientHandle_handle;
}

void __22__FBKLog_clientHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "Client");
  v1 = (void *)clientHandle_handle;
  clientHandle_handle = (uint64_t)v0;

}

+ (OS_os_log)net
{
  if (net_onceToken1 != -1)
    dispatch_once(&net_onceToken1, &__block_literal_global_12);
  return (OS_os_log *)(id)net_handle;
}

void __13__FBKLog_net__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "net");
  v1 = (void *)net_handle;
  net_handle = (uint64_t)v0;

}

+ (OS_os_log)appHandle
{
  if (appHandle_onceToken != -1)
    dispatch_once(&appHandle_onceToken, &__block_literal_global_14);
  return (OS_os_log *)(id)appHandle_handle;
}

void __19__FBKLog_appHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "Application");
  v1 = (void *)appHandle_handle;
  appHandle_handle = (uint64_t)v0;

}

+ (OS_os_log)attachHandle
{
  if (attachHandle_onceToken != -1)
    dispatch_once(&attachHandle_onceToken, &__block_literal_global_16);
  return (OS_os_log *)(id)attachHandle_handle;
}

void __22__FBKLog_attachHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "attach");
  v1 = (void *)attachHandle_handle;
  attachHandle_handle = (uint64_t)v0;

}

+ (OS_os_log)reachability
{
  if (reachability_onceToken != -1)
    dispatch_once(&reachability_onceToken, &__block_literal_global_18);
  return (OS_os_log *)(id)reachability_handle;
}

void __22__FBKLog_reachability__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "reachability");
  v1 = (void *)reachability_handle;
  reachability_handle = (uint64_t)v0;

}

+ (OS_os_log)ded
{
  if (ded_onceToken != -1)
    dispatch_once(&ded_onceToken, &__block_literal_global_20_0);
  return (OS_os_log *)(id)ded_handle;
}

void __13__FBKLog_ded__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "fded");
  v1 = (void *)ded_handle;
  ded_handle = (uint64_t)v0;

}

+ (OS_os_log)data
{
  if (data_onceToken != -1)
    dispatch_once(&data_onceToken, &__block_literal_global_22_1);
  return (OS_os_log *)(id)data_handle;
}

void __14__FBKLog_data__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "data");
  v1 = (void *)data_handle;
  data_handle = (uint64_t)v0;

}

+ (OS_os_log)sp2
{
  if (sp2_onceToken != -1)
    dispatch_once(&sp2_onceToken, &__block_literal_global_24);
  return (OS_os_log *)(id)sp2_handle;
}

void __13__FBKLog_sp2__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "sp2");
  v1 = (void *)sp2_handle;
  sp2_handle = (uint64_t)v0;

}

+ (OS_os_log)appleConnect
{
  if (appleConnect_onceToken != -1)
    dispatch_once(&appleConnect_onceToken, &__block_literal_global_26);
  return (OS_os_log *)(id)appleConnect_handle;
}

void __22__FBKLog_appleConnect__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "apple-connect");
  v1 = (void *)appleConnect_handle;
  appleConnect_handle = (uint64_t)v0;

}

+ (id)newURLActionActivity
{
  os_activity_t v2;
  void *v3;

  v2 = _os_activity_create(&dword_21D9A9000, "Starting feedback via URL scheme", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v3 = (void *)_URLActionActivity;
  _URLActionActivity = (uint64_t)v2;

  return (id)_URLActionActivity;
}

+ (id)currentURLActionActivity
{
  if (_URLActionActivity)
    return (id)objc_msgSend(a1, "newURLActionActivity");
  else
    return 0;
}

@end
