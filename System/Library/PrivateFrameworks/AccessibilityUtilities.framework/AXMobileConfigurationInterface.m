@implementation AXMobileConfigurationInterface

+ (id)activeRestrictionIdentifiers
{
  id v2;
  void *v3;
  int v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[AXBackBoardServer server](AXBackBoardServer, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGuidedAccessUnmanagedSelfLocked");

  if (v4)
    objc_msgSend(v2, "addObject:", CFSTR("com.apple.accessibility.unmanaged.asam.uuid"));
  return v2;
}

@end
