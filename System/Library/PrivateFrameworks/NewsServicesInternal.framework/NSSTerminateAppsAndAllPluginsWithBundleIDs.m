@implementation NSSTerminateAppsAndAllPluginsWithBundleIDs

void __NSSTerminateAppsAndAllPluginsWithBundleIDs_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CFE310]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __NSSTerminateAppsAndAllPluginsWithBundleIDs_block_invoke_2;
  v10 = &unk_1E9BDCD58;
  v11 = *(id *)(a1 + 32);
  v12 = v3;
  v5 = v3;
  v6 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:efficacy:name:withHandler:", v5, 3, CFSTR("com.apple.newsservices.termination"), &v7);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6, v7, v8, v9, v10);

}

void __NSSTerminateAppsAndAllPluginsWithBundleIDs_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

}

uint64_t __NSSTerminateAppsAndAllPluginsWithBundleIDs_block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeObjectsPerformSelector:", sel_invalidate);
}

@end
