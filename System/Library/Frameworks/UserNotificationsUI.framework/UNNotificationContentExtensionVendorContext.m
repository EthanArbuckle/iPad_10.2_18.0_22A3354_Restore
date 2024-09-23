@implementation UNNotificationContentExtensionVendorContext

void __74___UNNotificationContentExtensionVendorContext_openURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  _QWORD v8[4];
  id v9;
  char v10;
  id v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE38320];
  v12[0] = *MEMORY[0x24BE38310];
  v12[1] = v2;
  v13[0] = MEMORY[0x24BDBD1C8];
  v13[1] = MEMORY[0x24BDBD1C8];
  v12[2] = *MEMORY[0x24BE382E0];
  v13[2] = CFSTR("UNAppLaunchOriginContentExtension");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v11 = 0;
  v6 = objc_msgSend(v4, "openSensitiveURL:withOptions:error:", v5, v3, &v11);
  v7 = v11;

  if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR))
    __74___UNNotificationContentExtensionVendorContext_openURL_completionHandler___block_invoke_cold_1();
  if (*(_QWORD *)(a1 + 40))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __74___UNNotificationContentExtensionVendorContext_openURL_completionHandler___block_invoke_11;
    v8[3] = &unk_24D5BB1E8;
    v9 = *(id *)(a1 + 40);
    v10 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
}

uint64_t __74___UNNotificationContentExtensionVendorContext_openURL_completionHandler___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __71___UNNotificationContentExtensionVendorContext_setNotificationActions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __78___UNNotificationContentExtensionVendorContext__hostWantsToPreserveInputViews__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78___UNNotificationContentExtensionVendorContext__hostWantsToPreserveInputViews__block_invoke_2;
  block[3] = &unk_24D5BB060;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
}

void __78___UNNotificationContentExtensionVendorContext__hostWantsToPreserveInputViews__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "notificationExtensionContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "preserveInputViews");

}

void __77___UNNotificationContentExtensionVendorContext__hostWantsToRestoreInputViews__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77___UNNotificationContentExtensionVendorContext__hostWantsToRestoreInputViews__block_invoke_2;
  block[3] = &unk_24D5BB060;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
}

void __77___UNNotificationContentExtensionVendorContext__hostWantsToRestoreInputViews__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "notificationExtensionContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "restoreInputViews");

}

void __76___UNNotificationContentExtensionVendorContext__hostDidReceiveNotification___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __76___UNNotificationContentExtensionVendorContext__hostDidReceiveNotification___block_invoke_2;
  v2[3] = &unk_24D5BB140;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_sync(MEMORY[0x24BDAC9B8], v2);

}

void __76___UNNotificationContentExtensionVendorContext__hostDidReceiveNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_notificationExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "didCheckActionResponseDelegate") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_extensionWantsToReceiveActionResponses:", objc_opt_respondsToSelector() & 1);
    objc_msgSend(*(id *)(a1 + 32), "setDidCheckActionResponseDelegate:", 1);
  }
  v3 = objc_opt_respondsToSelector();
  v4 = (void *)UNLogExtensionsService;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      objc_msgSend(v5, "_UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v7;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_216870000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification %{public}@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(v2, "didReceiveNotification:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "notificationExtensionContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "_extensionWantsToBecomeFirstResponder:", objc_msgSend(v11, "canBecomeFirstResponder"));

  }
  else if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR))
  {
    __76___UNNotificationContentExtensionVendorContext__hostDidReceiveNotification___block_invoke_2_cold_1(v4);
  }

}

void __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke_2;
  v2[3] = &unk_24D5BB140;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_sync(MEMORY[0x24BDAC9B8], v2);

}

void __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_notificationExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *v2);
  v4 = objc_opt_respondsToSelector();
  v5 = (id)UNLogExtensionsService;
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "_UUID");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "notification");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "actionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v7;
      v22 = 2114;
      v23 = v11;
      v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_216870000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification response %{public}@ for @%{public}@", buf, 0x20u);

    }
    v13 = *(_QWORD *)(a1 + 40);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke_26;
    v16[3] = &unk_24D5BB260;
    objc_copyWeak(&v18, &location);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v3, "didReceiveNotificationResponse:completionHandler:", v13, v16);

    objc_destroyWeak(&v18);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke_2_cold_1(v15, (uint64_t)buf, v6);
    }

  }
  objc_destroyWeak(&location);

}

void __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke_26(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_extensionDidCompleteNotificationResponse:withOption:", *(_QWORD *)(a1 + 32), a2);

}

void __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke_2;
  block[3] = &unk_24D5BB2B0;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

void __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke_2(id *a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_notificationExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();
  v4 = (void *)UNLogExtensionsService;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      v6 = v4;
      objc_msgSend(v5, "_UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "notification");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "actionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v7;
      v19 = 2114;
      v20 = v11;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_216870000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification response %{public}@ for @%{public}@", buf, 0x20u);

    }
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke_28;
    v14[3] = &unk_24D5BB288;
    v13 = a1[5];
    v14[4] = a1[4];
    v15 = v13;
    v16 = a1[6];
    objc_msgSend(v2, "didReceiveNotificationResponse:completionHandler:", v15, v14);

  }
  else if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR))
  {
    __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke_2_cold_1(v4);
  }

}

uint64_t __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke_28(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)UNLogExtensionsService;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "_UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "notification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "un_logDigest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "actionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v7;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    v20 = 2048;
    v21 = a2;
    _os_log_impl(&dword_216870000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Extension called completion notification response %{public}@ for @%{public}@: %ld", (uint8_t *)&v14, 0x2Au);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __70___UNNotificationContentExtensionVendorContext__hostWantsMediaToPause__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70___UNNotificationContentExtensionVendorContext__hostWantsMediaToPause__block_invoke_2;
  block[3] = &unk_24D5BB060;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
}

void __70___UNNotificationContentExtensionVendorContext__hostWantsMediaToPause__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_notificationExtension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "mediaPause");
  }
  else
  {
    v2 = (void *)UNLogExtensionsService;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR))
      __70___UNNotificationContentExtensionVendorContext__hostWantsMediaToPause__block_invoke_2_cold_1(v2);
  }

}

void __69___UNNotificationContentExtensionVendorContext__hostWantsMediaToPlay__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69___UNNotificationContentExtensionVendorContext__hostWantsMediaToPlay__block_invoke_2;
  block[3] = &unk_24D5BB060;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
}

void __69___UNNotificationContentExtensionVendorContext__hostWantsMediaToPlay__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_notificationExtension");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "mediaPlay");
  }
  else
  {
    v2 = (void *)UNLogExtensionsService;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsService, OS_LOG_TYPE_ERROR))
      __69___UNNotificationContentExtensionVendorContext__hostWantsMediaToPlay__block_invoke_2_cold_1(v2);
  }

}

void __86___UNNotificationContentExtensionVendorContext__hostWantsToUpdateMediaPlayPauseButton__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86___UNNotificationContentExtensionVendorContext__hostWantsToUpdateMediaPlayPauseButton__block_invoke_2;
  block[3] = &unk_24D5BB060;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
}

uint64_t __86___UNNotificationContentExtensionVendorContext__hostWantsToUpdateMediaPlayPauseButton__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMediaPlayPauseButton");
}

void __74___UNNotificationContentExtensionVendorContext_openURL_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_216870000, v0, v1, "openURL: failed: %@", v2);
}

void __76___UNNotificationContentExtensionVendorContext__hostDidReceiveNotification___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_216870000, v4, v5, "Extension class %{public}@ does not implement selector didReceiveNotification:", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_216870000, a3, (uint64_t)a3, "Extension class %{public}@ does not implement selector didReceiveNotificationResponse:completionHandler:", (uint8_t *)a2);

}

void __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_216870000, v4, v5, "Extension class %{public}@ does not implement selector didReceiveNotificationResponse:completionHandler:", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __70___UNNotificationContentExtensionVendorContext__hostWantsMediaToPause__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_216870000, v4, v5, "Extension class %{public}@ does not implement selector mediaPause", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __69___UNNotificationContentExtensionVendorContext__hostWantsMediaToPlay__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_216870000, v4, v5, "Extension class %{public}@ does not implement selector mediaPlay", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

@end
