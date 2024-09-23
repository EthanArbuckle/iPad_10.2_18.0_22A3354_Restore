@implementation FPExtension

void __47__FPExtension_subsystem_beginUsing_withBundle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  Class Class;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "bundleInfoDictionary");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("NSExtension"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "objectForKey:", CFSTR("NSExtensionPrincipalClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "infoDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("NSExtensionPrincipalClass"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v9 = objc_retainAutorelease(v6);
  Class = objc_getClass((const char *)objc_msgSend(v9, "UTF8String"));
  if (!Class)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("FPExtension_subsystem.m"), 25, CFSTR("NSExtensionPrincipalClass %@ could not be resolved to class!"), v9);

  }
  +[FPXPlugInKitExtensionContext setPrincipalClass:](FPXPlugInKitExtensionContext, "setPrincipalClass:", Class);
  objc_msgSend(MEMORY[0x1E0CB3B70], "_startListening:", 1);

}

void __39__FPExtension_subsystem_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v1;

}

@end
