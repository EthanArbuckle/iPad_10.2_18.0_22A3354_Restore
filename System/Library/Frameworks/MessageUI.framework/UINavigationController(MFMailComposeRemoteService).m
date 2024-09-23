@implementation UINavigationController(MFMailComposeRemoteService)

- (uint64_t)mf_classesForUICustomization
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
}

- (id)mf_keyPathsMapForUICustomization
{
  if (mf_keyPathsMapForUICustomization_onceToken != -1)
    dispatch_once(&mf_keyPathsMapForUICustomization_onceToken, &__block_literal_global_24);
  return (id)mf_keyPathsMapForUICustomization_keyPathsMap;
}

@end
