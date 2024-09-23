@implementation CNUICoreLogProvider

+ (OS_os_log)likenesses_os_log
{
  if (likenesses_os_log_cn_once_token_2 != -1)
    dispatch_once(&likenesses_os_log_cn_once_token_2, &__block_literal_global_3_1);
  return (OS_os_log *)(id)likenesses_os_log_cn_once_object_2;
}

+ (OS_os_log)actions_os_log
{
  if (actions_os_log_cn_once_token_1 != -1)
    dispatch_once(&actions_os_log_cn_once_token_1, &__block_literal_global_47);
  return (OS_os_log *)(id)actions_os_log_cn_once_object_1;
}

void __40__CNUICoreLogProvider_likenesses_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "likenesses");
  v1 = (void *)likenesses_os_log_cn_once_object_2;
  likenesses_os_log_cn_once_object_2 = (uint64_t)v0;

}

void __45__CNUICoreLogProvider_static_identity_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "staticid");
  v1 = (void *)static_identity_os_log_cn_once_object_4;
  static_identity_os_log_cn_once_object_4 = (uint64_t)v0;

}

void __37__CNUICoreLogProvider_actions_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "actions");
  v1 = (void *)actions_os_log_cn_once_object_1;
  actions_os_log_cn_once_object_1 = (uint64_t)v0;

}

+ (OS_os_log)static_identity_os_log
{
  if (static_identity_os_log_cn_once_token_4 != -1)
    dispatch_once(&static_identity_os_log_cn_once_token_4, &__block_literal_global_7_0);
  return (OS_os_log *)(id)static_identity_os_log_cn_once_object_4;
}

+ (OS_os_log)corerecents_os_log
{
  if (corerecents_os_log_cn_once_token_3 != -1)
    dispatch_once(&corerecents_os_log_cn_once_token_3, &__block_literal_global_5_0);
  return (OS_os_log *)(id)corerecents_os_log_cn_once_object_3;
}

void __41__CNUICoreLogProvider_corerecents_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "core-recents");
  v1 = (void *)corerecents_os_log_cn_once_object_3;
  corerecents_os_log_cn_once_object_3 = (uint64_t)v0;

}

+ (OS_os_log)color_os_log
{
  if (color_os_log_cn_once_token_5 != -1)
    dispatch_once(&color_os_log_cn_once_token_5, &__block_literal_global_9_0);
  return (OS_os_log *)(id)color_os_log_cn_once_object_5;
}

void __35__CNUICoreLogProvider_color_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "color");
  v1 = (void *)color_os_log_cn_once_object_5;
  color_os_log_cn_once_object_5 = (uint64_t)v0;

}

@end
