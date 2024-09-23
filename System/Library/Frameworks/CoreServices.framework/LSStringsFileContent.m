@implementation LSStringsFileContent

void __32___LSStringsFileContent_IOQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.launchservices.localization-io", v2);
  v1 = (void *)+[_LSStringsFileContent IOQueue]::result;
  +[_LSStringsFileContent IOQueue]::result = (uint64_t)v0;

}

void __41___LSStringsFileContent_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __87___LSStringsFileContent_stringsFileContentFromBundle_forLocaleCode_cacheLocalizations___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __87___LSStringsFileContent_stringsFileContentFromBundle_forLocaleCode_cacheLocalizations___block_invoke_2(uint64_t a1)
{
  -[_LSStringsFileContent loadLoctableIfNecessaryFromBundle:](*(_QWORD *)(a1 + 32), *(__CFBundle **)(a1 + 48));
  return -[_LSStringsFileContent getStringsFileContentAfterLocTableLoadedInBundle:forLocale:](*(_QWORD *)(a1 + 32), *(__CFBundle **)(a1 + 48), *(void **)(a1 + 40));
}

void __76___LSStringsFileContent_prewarmAllLocalizationsWithBundle_forLocalizations___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSStringsFileContent getStringsFileContentAfterLocTableLoadedInBundle:forLocale:](*(_QWORD *)(a1 + 40), *(__CFBundle **)(a1 + 56), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prewarm");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76___LSStringsFileContent_prewarmAllLocalizationsWithBundle_forLocalizations___block_invoke_2;
  block[3] = &unk_1E1042318;
  v5 = *(NSObject **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_sync(v5, block);

}

uint64_t __76___LSStringsFileContent_prewarmAllLocalizationsWithBundle_forLocalizations___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

@end
