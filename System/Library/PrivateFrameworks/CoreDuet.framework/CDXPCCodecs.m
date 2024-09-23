@implementation CDXPCCodecs

void __20___CDXPCCodecs__log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreduet", "CDXPCCodecs");
  v1 = (void *)_log_log;
  _log_log = (uint64_t)v0;

}

void __35___CDXPCCodecs_eventTypeWithEvent___block_invoke()
{
  void *v0;

  v0 = (void *)eventTypeWithEvent__eventTypeByMsgType;
  eventTypeWithEvent__eventTypeByMsgType = (uint64_t)&unk_1E272C0F8;

}

void __43___CDXPCCodecs_supportedClassesToUnarchive__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v18 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v17, v16, v15, v14, v13, v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(),
    0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)supportedClassesToUnarchive_supportedClasses;
  supportedClassesToUnarchive_supportedClasses = v10;

}

@end
