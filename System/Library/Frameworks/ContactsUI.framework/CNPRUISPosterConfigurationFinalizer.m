@implementation CNPRUISPosterConfigurationFinalizer

+ (id)finalizedConfiguration:(id)a3 forExtensionIdentifier:(id)a4
{
  Class (__cdecl *v5)();
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  Class v12;
  void *v13;
  void *v14;
  void *v15;
  CNPRSPosterConfiguration *v16;

  v5 = (Class (__cdecl *)())getPRSPosterConfigurationAttributesClass[0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc(v5());
  objc_msgSend(v7, "wrappedMutablePosterConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithPath:extensionIdentifier:", v10, v6);

  v12 = (Class)getPRPosterConfiguredPropertiesClass[0]();
  getPRSPosterRoleIncomingCall[0]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class defaultConfiguredPropertiesForRole:](v12, "defaultConfiguredPropertiesForRole:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((Class)getPRUISPosterConfigurationFinalizerClass[0](), "finalizedConfigurationForAttributes:withConfiguredProperties:error:", v11, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CNPRSPosterConfiguration initWithPosterConfiguration:]([CNPRSPosterConfiguration alloc], "initWithPosterConfiguration:", v15);

  return v16;
}

@end
