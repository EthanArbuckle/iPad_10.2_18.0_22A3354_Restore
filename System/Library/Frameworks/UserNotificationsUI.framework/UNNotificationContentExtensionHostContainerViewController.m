@implementation UNNotificationContentExtensionHostContainerViewController

void __85___UNNotificationContentExtensionHostContainerViewController_isMediaSafetyNetEnabled__block_invoke()
{
  if (!MediaSafetyNetLibraryCore_frameworkLibrary)
    MediaSafetyNetLibraryCore_frameworkLibrary = _sl_dlopen();
  isMediaSafetyNetEnabled_enabled = MediaSafetyNetLibraryCore_frameworkLibrary != 0;
}

uint64_t __98___UNNotificationContentExtensionHostContainerViewController__addExtensionViewFromViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __90___UNNotificationContentExtensionHostContainerViewController__loadExtensionViewController__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BYTE v25[24];
  void *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v11 = v8;
  v12 = (void *)UNLogExtensionsHost;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(a1 + 32);
      v14 = v12;
      objc_msgSend(v13, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow");
      *(_DWORD *)v25 = 138544130;
      *(_QWORD *)&v25[4] = v7;
      *(_WORD *)&v25[12] = 2114;
      *(_QWORD *)&v25[14] = v15;
      *(_WORD *)&v25[22] = 2114;
      v26 = v16;
      v27 = 2048;
      v28 = fabs(v17);
      _os_log_impl(&dword_216870000, v14, OS_LOG_TYPE_DEFAULT, "Loaded host view controller with extension request %{public}@ from extension %{public}@ for notification request %{public}@ (%.2fs)", v25, 0x2Au);

    }
    if (+[_UNNotificationContentExtensionHostContainerViewController isMediaSafetyNetEnabled](_UNNotificationContentExtensionHostContainerViewController, "isMediaSafetyNetEnabled"))
    {
      *(_QWORD *)v25 = 0;
      *(_QWORD *)&v25[8] = v25;
      *(_QWORD *)&v25[16] = 0x2020000000;
      v18 = getMSNMonitorBeginExceptionSymbolLoc_ptr;
      v26 = getMSNMonitorBeginExceptionSymbolLoc_ptr;
      if (!getMSNMonitorBeginExceptionSymbolLoc_ptr)
      {
        v19 = (void *)MediaSafetyNetLibrary();
        v18 = dlsym(v19, "MSNMonitorBeginException");
        *(_QWORD *)(*(_QWORD *)&v25[8] + 24) = v18;
        getMSNMonitorBeginExceptionSymbolLoc_ptr = v18;
      }
      _Block_object_dispose(v25, 8);
      if (!v18)
      {
        -[_UNNotificationContentExtensionHostContainerViewController _teardownExtension].cold.1();
        __break(1u);
      }
      ((void (*)(const char *))v18)("notificationappex");
    }
    v20 = (id *)(a1 + 32);
    objc_msgSend(v11, "setExtension:", *(_QWORD *)(a1 + 32), *(_QWORD *)v25);
    objc_msgSend(v11, "setExtensionRequestIdentifier:", v7);
    objc_msgSend(v11, "setNotificationRequestIdentifier:", *(_QWORD *)(a1 + 56));
    objc_opt_class();
    UNSafeCast();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v20, "_extensionContextForUUID:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    UNSafeCast();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "setExtensionHostContext:", v23);
    objc_msgSend(WeakRetained, "setExtensionViewController:", v11);
    objc_msgSend(WeakRetained, "_setupExtensionViewController:", v11);
    objc_msgSend(WeakRetained, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v24, "extensionViewControllerDidLoadExtension:", WeakRetained);
    if (objc_msgSend(WeakRetained, "isDefaultTitleOverridden")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v24, "extensionViewControllerDidUpdateTitle:", WeakRetained);
    }

  }
  else if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_FAULT))
  {
    __90___UNNotificationContentExtensionHostContainerViewController__loadExtensionViewController__block_invoke_cold_1(a1, v12, v9);
  }

}

void __90___UNNotificationContentExtensionHostContainerViewController__loadExtensionViewController__block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  OUTLINED_FUNCTION_0_0(&dword_216870000, v5, v8, "Failed to load host view controller for extension %{public}@: %{public}@", (uint8_t *)&v9);

}

@end
