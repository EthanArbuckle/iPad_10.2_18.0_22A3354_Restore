@implementation ICInternalSettingsIsMathEnabled

void __ICInternalSettingsIsMathEnabled_block_invoke()
{
  id v0;

  if (_os_feature_enabled_impl())
  {
    ICInternalSettingsIsMathEnabled_isEnabled = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    ICInternalSettingsIsMathEnabled_isEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("EnableMath"));

  }
}

@end
