@implementation MSMessageAppExtensionHostContext

void __88___MSMessageAppExtensionHostContext__extensionContextHostProtocolAllowedClassesForItems__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS____MSMessageAppExtensionHostContext;
  objc_msgSendSuper2(&v7, sel__extensionContextHostProtocolAllowedClassesForItems);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E20];
  v8[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "unionSet:", v1);
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)_extensionContextHostProtocolAllowedClassesForItems_allowedClasses_0;
  _extensionContextHostProtocolAllowedClassesForItems_allowedClasses_0 = v5;

}

@end
