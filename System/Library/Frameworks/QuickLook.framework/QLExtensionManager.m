@implementation QLExtensionManager

void __145__QLExtensionManager_Internal__remoteViewControllerForContentType_applicationBundleIdentifier_extensionType_generatonType_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject **v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = (NSObject **)MEMORY[0x24BE7BF48];
    v11 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_FAULT, "Error while instantiating view controller: %@ #Remote", (uint8_t *)&v13, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_extensionContextForUUID:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
