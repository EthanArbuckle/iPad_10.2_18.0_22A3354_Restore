@implementation AXSettings(AccessibilitySupportFacade)

- (int64_t)hoverTextScrollingSpeed
{
  return AXSettingsReturnIntegerValue(CFSTR("HoverTextScrollingSpeed"), 2);
}

- (void)setHoverTextScrollingSpeed:()AccessibilitySupportFacade
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("HoverTextScrollingSpeed"));

}

- (void)setHoverTextContentSize:()AccessibilitySupportFacade
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HTLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_INFO, "User is setting HoverText size to %@", (uint8_t *)&v5, 0xCu);
  }

  _AXSHoverTextSetContentSize();
}

- (NSString)hoverTextContentSize
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)_AXSHoverTextCopyContentSize();
  v3 = v2;
  if (v2 && !objc_msgSend(v2, "isEqualToString:", CFSTR("_UICTContentSizeCategoryUnspecified")))
    v4 = v3;
  else
    v4 = (id)_AXSCopyPreferredContentSizeCategoryNameGlobal();
  v5 = v4;

  return (NSString *)v5;
}

- (BOOL)hoverTextShowedBanner
{
  return AXSettingsReturnBoolValue(CFSTR("HoverTextShowedBanner"), 0);
}

- (void)setHoverTextShowedBanner:()AccessibilitySupportFacade
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("HoverTextShowedBanner"));

}

- (BOOL)hoverTextTypingShowedBanner
{
  return AXSettingsReturnBoolValue(CFSTR("HoverTextTypingShowedBanner"), 0);
}

- (void)setHoverTextTypingShowedBanner:()AccessibilitySupportFacade
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("HoverTextTypingShowedBanner"));

}

@end
