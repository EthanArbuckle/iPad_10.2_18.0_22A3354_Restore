@implementation EXUIKit

void __43__EXUIKit_Subsystem_beginUsing_withBundle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  Class v14;
  NSObject *v15;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(*(id *)(a1 + 40), "bundleInfoDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setInfoDictionary:", v2);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", CFSTR("NSExtension"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "objectForKey:", CFSTR("NSExtensionMainStoryboard"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("NSExtensionMainStoryboard~ipad"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    objc_msgSend(v4, "objectForKey:", CFSTR("NSExtensionPrincipalClass"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "infoDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("NSExtensionPrincipalClass"));
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
    if (v8)
      goto LABEL_9;
    v14 = NSClassFromString(v11);
    if (!v14)
    {
      _EXLegacyLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __43__EXUIKit_Subsystem_beginUsing_withBundle___block_invoke_cold_1(v15);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && -[objc_class _initializedByViewServices](v14, "_initializedByViewServices"))
    {
LABEL_9:
      -[objc_class startViewServiceSessionManagerAsPlugin:](NSClassFromString(CFSTR("_UIViewServiceSessionManager")), "startViewServiceSessionManagerAsPlugin:", 1);
    }
    +[EXConcreteExtensionContextVendor _startListening](EXConcreteExtensionContextVendor, "_startListening");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;

  }
}

void __35__EXUIKit_Subsystem_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v1;

}

void __43__EXUIKit_Subsystem_beginUsing_withBundle___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_190C25000, log, OS_LOG_TYPE_FAULT, "NSExtensionPrincipalClass could not be resolved to class!", v1, 2u);
}

@end
