@implementation NSExtensionContext(WFApplicationContextProvider)

- (id)bundleForWFApplicationContext:()WFApplicationContextProvider
{
  void *v4;
  void *v5;
  void *v7;

  objc_msgSend(a1, "extensionApplicationContextProviderDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSExtensionContext+WFApplicationContextProvider.m"), 24, CFSTR("The extension application context provider delegate is not set."));

  }
  objc_msgSend(v4, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentUserInterfaceTypeForWFApplicationContext:()WFApplicationContextProvider
{
  void *v4;
  void *v5;
  void *v7;

  objc_msgSend(a1, "extensionApplicationContextProviderDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSExtensionContext+WFApplicationContextProvider.m"), 30, CFSTR("The extension application context provider delegate is not set."));

  }
  objc_msgSend(v4, "currentUserInterfaceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)notificationNameForApplicationStateEvent:()WFApplicationContextProvider applicationContext:
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "extensionApplicationContextProviderDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationNameForApplicationStateEvent:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)extensionApplicationContextProviderDelegate
{
  void *v1;
  void *v2;

  objc_getAssociatedObject(a1, sel_extensionApplicationContextProviderDelegate);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setExtensionApplicationContextProviderDelegate:()WFApplicationContextProvider
{
  void *v4;
  id v5;
  id value;

  v4 = (void *)MEMORY[0x24BDD15C0];
  v5 = a3;
  objc_msgSend(v4, "weakObjectsHashTable");
  value = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(value, "addObject:", v5);

  objc_setAssociatedObject(a1, sel_extensionApplicationContextProviderDelegate, value, (void *)1);
}

- (id)keyWindowForWFApplicationContext:()WFApplicationContextProvider
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "extensionApplicationContextProviderDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "extensionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)applicationForWFApplicationContext:()WFApplicationContextProvider
{
  return 0;
}

- (BOOL)shouldReverseLayoutDirection
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "extensionApplicationContextProviderDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "extensionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection") == 1;

  return v4;
}

@end
