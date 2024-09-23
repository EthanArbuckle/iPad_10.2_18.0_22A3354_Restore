@implementation LSSharedWebCredentialsAppLinkPlugIn

uint64_t __101___LSSharedWebCredentialsAppLinkPlugIn_bindingWithContext_forServiceDetails_callingBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (((*(unsigned __int16 *)(*(_QWORD *)(a3 + 8) + 189) | (*(unsigned __int8 *)(*(_QWORD *)(a3 + 8) + 191) << 16)) & 0x80001) != 0)
    return 0;
  v7 = (void *)_CSStringCopyCFString();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a2, *(unsigned int *)(*(_QWORD *)(a3 + 8) + 140));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_applicationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 40));

  }
  return v3;
}

void __74___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_forSWCResults___block_invoke(uint64_t a1, unsigned int *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  id v11;

  v5 = a3;
  v6 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]([LSApplicationRecord alloc], "_initWithContext:bundleID:bundleData:error:", *(_QWORD *)(a1 + 56), *a2, *((_QWORD *)a2 + 1), 0);
  v11 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "URLComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[LSAppLink _appLinkWithURL:applicationRecord:plugInClass:](_LSSharedWebCredentialsAppLink, "_appLinkWithURL:applicationRecord:plugInClass:", v8, v6, objc_opt_class());
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = *((_OWORD *)a2 + 1);
      *(_OWORD *)(v9 + 32) = *(_OWORD *)a2;
      *(_OWORD *)(v9 + 48) = v10;
      objc_storeStrong((id *)(v9 + 64), *((id *)a2 + 4));
      objc_storeStrong((id *)(v9 + 72), *((id *)a2 + 5));
      objc_msgSend((id)v9, "setServiceDetails:", v5);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
      std::vector<LSApplicationRecord * {__strong}>::emplace_back<LSApplicationRecord * {__strong}&>((char **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), &v11);
    }

  }
}

void __66___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_error___block_invoke(uint64_t a1)
{
  _LSDServiceDomain *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void **v9;
  id v10;
  char v11;
  id v12;

  v9 = *(void ***)(a1 + 56);
  v10 = 0;
  v11 = 0;
  v12 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v3 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v9, v2, 0);

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "appLinksWithContext:forSWCResults:", v3, *(_QWORD *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (void *)v4;
    else
      v6 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v6);

  }
  if (v9 && v11)
    _LSContextDestroy(v9);
  v7 = v10;
  v9 = 0;
  v10 = 0;

  v11 = 0;
  v8 = v12;
  v12 = 0;

}

uint64_t __66___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
