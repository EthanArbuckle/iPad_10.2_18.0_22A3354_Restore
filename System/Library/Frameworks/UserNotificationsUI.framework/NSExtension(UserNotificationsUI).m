@implementation NSExtension(UserNotificationsUI)

- (id)_un_extensionContainerBundleIdentifier
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;

  v2 = objc_alloc(MEMORY[0x24BDC1528]);
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:error:", v3, &v10);
  v5 = v10;

  if (v4)
  {
    objc_msgSend(v4, "containingBundleRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)UNLogExtensions;
    if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_ERROR))
      -[NSExtension(UserNotificationsUI) _un_extensionContainerBundleIdentifier].cold.1(v8, a1, v5);
    v7 = 0;
  }

  return v7;
}

- (id)_un_customSectionIdentifiers
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple."));

  if (v3)
  {
    objc_msgSend(a1, "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("UNNotificationExtensionCustomSectionIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = UNLogExtensions;
        if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_ERROR))
          -[NSExtension(UserNotificationsUI) _un_customSectionIdentifiers].cold.1(v9, v10, v11);
        v8 = 0;
        goto LABEL_13;
      }
      v15[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;
LABEL_13:

    goto LABEL_14;
  }
  v7 = (void *)UNLogExtensions;
  if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_ERROR))
    -[NSExtension(UserNotificationsUI) _un_customSectionIdentifiers].cold.2(v7, a1);
  v8 = 0;
LABEL_14:
  if (v8)
    v12 = v8;
  else
    v12 = (void *)MEMORY[0x24BDBD1A8];
  v13 = v12;

  return v13;
}

- (id)un_allowedSourceIdentifiers
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_un_extensionContainerBundleIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v7[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_un_customSectionIdentifiers");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)un_supportedCategoryIdentifiers
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UNNotificationExtensionCategory"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
LABEL_5:
    v4 = v3;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v5 = UNLogExtensions;
  if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_ERROR))
    -[NSExtension(UserNotificationsUI) un_supportedCategoryIdentifiers].cold.1(v5, v6, v7);
  v4 = (void *)MEMORY[0x24BDBD1A8];
LABEL_9:

  return v4;
}

- (id)_un_contentSizeRatio
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UNNotificationExtensionInitialContentSizeRatio"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (double)un_effectiveContentSizeRatio
{
  void *v1;
  void *v2;
  float v3;
  double v4;

  objc_msgSend(a1, "_un_contentSizeRatio");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "floatValue");
    v4 = v3;
  }
  else
  {
    v4 = 1.0;
  }

  return v4;
}

- (uint64_t)un_isDefaultContentHidden
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UNNotificationExtensionDefaultContentHidden"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)un_isDefaultTitleOverridden
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UNNotificationExtensionOverridesDefaultTitle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)un_isUserInteractionEnabled
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UNNotificationExtensionUserInteractionEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_un_extensionContainerBundleIdentifier
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_216870000, v5, OS_LOG_TYPE_ERROR, "Encountered error obtaining application extension record for extension %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);

}

- (void)_un_customSectionIdentifiers
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0(&dword_216870000, v3, v5, "Extension %{public}@ requested a custom section identifier but it is not an internal extension", (uint8_t *)&v6);

}

- (void)un_supportedCategoryIdentifiers
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = CFSTR("UNNotificationExtensionCategory");
  OUTLINED_FUNCTION_0(&dword_216870000, a1, a3, "Invalid value for %{public}@ in Info.plist", (uint8_t *)&v3);
}

@end
