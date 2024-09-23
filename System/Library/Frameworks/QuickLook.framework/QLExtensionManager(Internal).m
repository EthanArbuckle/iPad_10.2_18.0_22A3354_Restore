@implementation QLExtensionManager(Internal)

- (void)remoteViewControllerForContentType:()Internal applicationBundleIdentifier:extensionType:generatonType:withCompletionHandler:
{
  id v12;
  id v13;
  id v14;
  NSObject **v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (a5)
  {
    v15 = (NSObject **)MEMORY[0x24BE7BF48];
    v16 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v16 = *v15;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4F5000, v16, OS_LOG_TYPE_ERROR, "Remove view controllers can be provided for UI extensions only. #Remote", buf, 2u);
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v14 + 2))(v14, 0, 0, 0, 0);
  }
  else
  {
    LOBYTE(v19) = 1;
    objc_msgSend(a1, "extensionForContentType:allowExtensionsForParentTypes:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:", v12, 0, v13, 0, 0, a6, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __145__QLExtensionManager_Internal__remoteViewControllerForContentType_applicationBundleIdentifier_extensionType_generatonType_withCompletionHandler___block_invoke;
      v20[3] = &unk_24C7253C0;
      v21 = v17;
      v22 = v14;
      objc_msgSend(v21, "instantiateViewControllerWithInputItems:connectionHandler:", 0, v20);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v14 + 2))(v14, 0, 0, 0, 0);
    }

  }
}

@end
