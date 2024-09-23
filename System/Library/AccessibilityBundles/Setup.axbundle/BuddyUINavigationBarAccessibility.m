@implementation BuddyUINavigationBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UINavigationBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityIdentifier
{
  NSObject *v3;
  __CFString *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  BuddyUINavigationBarAccessibility *v10;
  __CFString *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  BuddyUINavigationBarAccessibility *v21;
  BuddyUINavigationBarAccessibility *v22;
  NSObject *v23;
  BuddyUINavigationBarAccessibility *v24;
  objc_super v26;
  objc_super v27;
  char v28;
  uint8_t buf[4];
  BuddyUINavigationBarAccessibility *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  AXLogUIA();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[BuddyUINavigationBarAccessibility accessibilityIdentification](self, "accessibilityIdentification");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = self;
    v31 = 2112;
    v32 = v4;
    _os_log_impl(&dword_23299E000, v3, OS_LOG_TYPE_INFO, "NavBar: Buddy: identification:%@ %@", buf, 0x16u);

  }
  -[BuddyUINavigationBarAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AXSetupMainNavBar"));

  if (v6)
  {
    buf[0] = 0;
    objc_opt_class();
    v28 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    objc_msgSend(v7, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v10 = (BuddyUINavigationBarAccessibility *)objc_claimAutoreleasedReturnValue();

    if (buf[0])
      abort();
    -[BuddyUINavigationBarAccessibility visibleViewController](v10, "visibleViewController");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    AXLogUIA();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_23299E000, v12, OS_LOG_TYPE_INFO, "NavBar: Buddy: nav controller: %@ visible: %@", buf, 0x16u);
    }

    if (v11)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("Controller"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      __UIAccessibilityCastAsSafeCategory();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17 && (objc_msgSend(v17, "accessibilityShowsEscapeOffer") & 1) == 0)
      {
        -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", CFSTR("DeviceChosen"));
        v19 = objc_claimAutoreleasedReturnValue();

        v16 = (__CFString *)v19;
      }
      AXLogUIA();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = (BuddyUINavigationBarAccessibility *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v30 = v21;
        v31 = 2112;
        v32 = v16;
        v22 = v21;
        _os_log_impl(&dword_23299E000, v20, OS_LOG_TYPE_INFO, "NavBar: Buddy: class: %@, name: %@", buf, 0x16u);

      }
    }
    else
    {
      v16 = CFSTR("UnknownSetupPane");
    }

    return v16;
  }
  else
  {
    AXLogUIA();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v27.receiver = self;
      v27.super_class = (Class)BuddyUINavigationBarAccessibility;
      -[BuddyUINavigationBarAccessibility accessibilityIdentifier](&v27, sel_accessibilityIdentifier);
      v24 = (BuddyUINavigationBarAccessibility *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v24;
      _os_log_impl(&dword_23299E000, v23, OS_LOG_TYPE_INFO, "NavBar: Buddy: returning super identifier: %@", buf, 0xCu);

    }
    v26.receiver = self;
    v26.super_class = (Class)BuddyUINavigationBarAccessibility;
    -[BuddyUINavigationBarAccessibility accessibilityIdentifier](&v26, sel_accessibilityIdentifier);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
