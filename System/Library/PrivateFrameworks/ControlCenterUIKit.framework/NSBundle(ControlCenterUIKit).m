@implementation NSBundle(ControlCenterUIKit)

- (void)ccui_associateWithModuleInstance:()ControlCenterUIKit
{
  objc_setAssociatedObject(object, "CCUIAssociatedBundle", value, (void *)0x301);
}

+ (id)ccui_bundleForModuleInstance:()ControlCenterUIKit
{
  return objc_getAssociatedObject(object, "CCUIAssociatedBundle");
}

- (id)ccui_displayName
{
  void *v2;

  objc_msgSend(a1, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AAC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE88]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(a1, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE70]);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v2)
      {
        objc_msgSend(a1, "bundleIdentifier");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v2;
}

@end
