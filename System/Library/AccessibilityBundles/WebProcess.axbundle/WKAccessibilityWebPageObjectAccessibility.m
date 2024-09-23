@implementation WKAccessibilityWebPageObjectAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WKAccessibilityWebPageObject");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKAccessibilityWebPageObject"), CFSTR("setRemoteTokenData:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKAccessibilityWebPageObject"), CFSTR("_accessibilityCategoryInstalled:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKAccessibilityWebPageObject"), CFSTR("remoteTokenData"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKAccessibilityWebPageObject"), CFSTR("accessibilityHitTest:"), "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKAccessibilityWebPageObjectBase"), CFSTR("accessibilityRootObjectWrapper"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKAccessibilityWebPageObjectBase"), CFSTR("accessibilityFocusedUIElement"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("WKAccessibilityWebPageObject"), CFSTR("WKAccessibilityWebPageObjectBase"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("enableAttributeCaching"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("disableAttributeCaching"), "v", 0);

}

- (WKAccessibilityWebPageObjectAccessibility)init
{
  WKAccessibilityWebPageObjectAccessibility *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WKAccessibilityWebPageObjectAccessibility;
  v2 = -[WKAccessibilityWebPageObjectAccessibility init](&v4, sel_init);
  -[WKAccessibilityWebPageObjectAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");

  return v2;
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  WKAccessibilityWebPageObjectAccessibility *v4;
  objc_super v5;

  -[WKAccessibilityWebPageObjectAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("axRemoteElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteChildrenDelegate");
  v4 = (WKAccessibilityWebPageObjectAccessibility *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    objc_msgSend(v3, "setRemoteChildrenDelegate:", 0);
    objc_msgSend(v3, "unregister");
  }
  -[WKAccessibilityWebPageObjectAccessibility _accessibilityUnregister](self, "_accessibilityUnregister");

  v5.receiver = self;
  v5.super_class = (Class)WKAccessibilityWebPageObjectAccessibility;
  -[WKAccessibilityWebPageObjectAccessibility dealloc](&v5, sel_dealloc);
}

- (void)_initializeRemoteElement:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFEA78], "registerRemoteElement:remotePort:", a3, 0);
}

- (int)_accessibilityHostPid
{
  void *v2;
  int v3;

  -[WKAccessibilityWebPageObjectAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("axRemoteElement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v2, "remotePid") < 1)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "remotePid");

  return v3;
}

- (id)_accessibilityApplication
{
  void *v2;
  void *AppElementWithPid;

  -[WKAccessibilityWebPageObjectAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("axRemoteElement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v2, "remotePid") < 1)
  {
    AppElementWithPid = 0;
  }
  else
  {
    objc_msgSend(v2, "remotePid");
    AppElementWithPid = (void *)_AXUIElementCreateAppElementWithPid();
  }

  return AppElementWithPid;
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double y;
  double x;
  objc_super v7;

  y = a3.y;
  x = a3.x;
  -[WKAccessibilityWebPageObjectAccessibility _initializeRootIfNecessary](self, "_initializeRootIfNecessary");
  v7.receiver = self;
  v7.super_class = (Class)WKAccessibilityWebPageObjectAccessibility;
  -[WKAccessibilityWebPageObjectAccessibility accessibilityHitTest:](&v7, sel_accessibilityHitTest_, x, y);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_enableCaching
{
  void *v2;
  id v3;
  id v4;

  -[WKAccessibilityWebPageObjectAccessibility accessibilityElements](self, "accessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("enableAttributeCaching"));

}

- (void)_disableCaching
{
  void *v2;
  id v3;
  id v4;

  -[WKAccessibilityWebPageObjectAccessibility accessibilityElements](self, "accessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("disableAttributeCaching"));

}

- (id)_accessibilityResponderElement
{
  void *v3;
  void *v4;

  -[WKAccessibilityWebPageObjectAccessibility _initializeRootIfNecessary](self, "_initializeRootIfNecessary");
  -[WKAccessibilityWebPageObjectAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityFocusedUIElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityFindDescendant:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __75__WKAccessibilityWebPageObjectAccessibility__accessibilityResponderElement__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

- (id)_accessibilityTextViewTextOperationResponder
{
  void *v2;
  void *v3;
  void *v4;

  -[WKAccessibilityWebPageObjectAccessibility accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setOnClientSide:", 1);
  v4 = (void *)_AXCreateAXUIElementWithElement();
  objc_msgSend(v3, "setOnClientSide:", 0);

  return v4;
}

- (void)_axCachedRootObject
{
  void *v2;
  void *v3;

  -[WKAccessibilityWebPageObjectAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXRootObjectCache"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "pointerValue");

  return v3;
}

- (void)_axSetCachedRootObject:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKAccessibilityWebPageObjectAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("AXRootObjectCache"));

}

- (void)_initializeRootIfNecessary
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[WKAccessibilityWebPageObjectAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityRootObjectWrapper"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityContainer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v6 = v7;
    if (!v7)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4 = (void *)v3;
  v5 = -[WKAccessibilityWebPageObjectAccessibility _axCachedRootObject](self, "_axCachedRootObject");

  v6 = v7;
  if (v7 && v7 != v5)
  {
LABEL_4:
    objc_msgSend(v7, "setAccessibilityContainer:", self);
    -[WKAccessibilityWebPageObjectAccessibility _axSetCachedRootObject:](self, "_axSetCachedRootObject:", v7);
    v6 = v7;
  }
LABEL_5:

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[WKAccessibilityWebPageObjectAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityRootObjectWrapper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKAccessibilityWebPageObjectAccessibility _initializeRootIfNecessary](self, "_initializeRootIfNecessary");
  if (v3)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)accessibilityRemoteSubstituteChildren:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_axRemoteElementRegistered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("element"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    _AXAssert();
  -[WKAccessibilityWebPageObjectAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("remoteTokenData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WKAccessibilityWebPageObjectAccessibility _axUnarchivedTokenForData:](self, "_axUnarchivedTokenForData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("ax-uuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
    -[WKAccessibilityWebPageObjectAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("axRemoteElement"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 != v6)
    {
      objc_msgSend(v13, "setRemoteChildrenDelegate:", 0);
      objc_msgSend(v14, "unregister");
      objc_msgSend(v6, "setRemoteChildrenDelegate:", self);
      -[WKAccessibilityWebPageObjectAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("axRemoteElement"));
    }

  }
}

- (id)accessibilityContainer
{
  return (id)-[WKAccessibilityWebPageObjectAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("axRemoteElement"));
}

- (void)_axListenForRemoteElement
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__axRemoteElementRegistered_, CFSTR("ax_remote_element_registered"), 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKAccessibilityWebPageObjectAccessibility;
  -[WKAccessibilityWebPageObjectAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  _AXAddToElementCache();
  -[WKAccessibilityWebPageObjectAccessibility _axListenForRemoteElement](self, "_axListenForRemoteElement");
  -[WKAccessibilityWebPageObjectAccessibility remoteTokenData](self, "remoteTokenData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WKAccessibilityWebPageObjectAccessibility _axUnarchivedTokenForData:](self, "_axUnarchivedTokenForData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKAccessibilityWebPageObjectAccessibility _initializeRemoteElement:](self, "_initializeRemoteElement:", v4);

  }
}

- (void)setRemoteTokenData:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKAccessibilityWebPageObjectAccessibility;
  v4 = a3;
  -[WKAccessibilityWebPageObjectAccessibility setRemoteTokenData:](&v6, sel_setRemoteTokenData_, v4);
  -[WKAccessibilityWebPageObjectAccessibility _axUnarchivedTokenForData:](self, "_axUnarchivedTokenForData:", v4, v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WKAccessibilityWebPageObjectAccessibility _initializeRemoteElement:](self, "_initializeRemoteElement:", v5);
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[WKAccessibilityWebPageObjectAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityRootObjectWrapper"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v7 = *MEMORY[0x24BDBEFB0];
  v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);

  v9 = v7;
  v10 = v8;
  v11 = v4;
  v12 = v6;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)_axUnarchivedTokenForData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1620];
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v8, v3, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;

  if (v10)
  {
    AXLogAppAccessibility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WKAccessibilityWebPageObjectAccessibility _axUnarchivedTokenForData:].cold.1((uint64_t)v10, (uint64_t)v3, v11);

  }
  return v9;
}

- (void)_axUnarchivedTokenForData:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_230E4C000, log, OS_LOG_TYPE_ERROR, "Problem with unarchiving remote token data: %@ %@", (uint8_t *)&v3, 0x16u);
}

@end
